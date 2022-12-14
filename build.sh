# libfoo, libbar
gcc -c -Wall -fPIC foo.c bar.c
gcc -shared -o libfoo.so foo.o
gcc -shared -o libbar.so bar.o

# libfoobar
gcc -c -Wall -fPIC foobar.c
gcc -shared -o libfoobar.so foobar.o -L. -lfoo -lbar -Wl,-rpath=$(pwd)

# prog
gcc -c -Wall main.c
gcc -o prog main.o -L. -lfoobar -Wl,-rpath=$(pwd)
