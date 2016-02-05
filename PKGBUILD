# Maintainer: Denis Gruzdev <chezstov@gmail.com>

pkgname=valgrind-svn
pkgver=3.12.0.SVN
pkgrel=1
pkgdesc='A tool to help find memory-management problems in programs'
url='http://valgrind.org/'
source=('svn://svn.valgrind.org/valgrind/trunk')
license=(GPL)

provides=(valgrind)
conflicts=(valgrind)
depends=(glibc perl)
makedepends=(gdb openmpi)
optdepends=('openmpi: MPI support')
options=('!emptydirs' '!buildflags')

arch=(i686 x86_64)
sha1sums=('SKIP')

pkgver() {
  cd trunk
  cat configure.ac | grep 'AC_INIT(\[Valgrind\],\[' | cut -d'[' -f3 | cut -d']' -f1
}

build() {
  cd trunk
  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man --with-mpicc=mpicc
  make $MAKEFLAGS
}

package() {
  cd trunk
  make DESTDIR="$pkgdir" install
}
