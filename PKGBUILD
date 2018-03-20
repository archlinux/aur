# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=charm++-mpi
pkgver=6.8.2
pkgrel=2
pkgdesc="Parallel programming framework in C++ supported by an adaptive runtime system. MPI version"
url="http://charm.cs.illinois.edu/research/charm"
license=('custom')
arch=('x86_64')
depends=('openmpi')
makedepends=('gcc')
provides=('charm++')
conflicts=('charm++')
md5sums=('a887a34b638a5b2f7fcf7ff3c262496d')
options=('staticlibs' '!strip')

source=("http://charm.cs.illinois.edu/distrib/charm-${pkgver}.tar.gz")

build() {
  cd ${srcdir}/charm-v${pkgver}

  MPICXX=mpicxx
  ./build charm++ mpi-linux-x86_64 --with-production

  cd mpi-linux-x86_64/tests/charm++/megatest
  make pgm
  mpirun -n 2 ./pgm
}

package() {
  cd ${srcdir}/charm-v${pkgver}

  mkdir -p ${pkgdir}/opt/charm++
  cp -ar bin doc include lib lib_so examples tests tmp mpi-linux-x86_64 src ${pkgdir}/opt/charm++
}

