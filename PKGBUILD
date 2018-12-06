# Contributor: Jed Brown <jed@59A2.org>
# Contributor: George Eleftheriou <eleftg>

pkgname=parmetis-mpich
pkgver=4.0.3.p4
_pkgver=4.0.3-p4
_pkgdirname=petsc-pkg-parmetis-73dab469aa36
_prefix=/opt/mpich
pkgrel=1
pkgdesc="A parallel graph partitioning library, built against MPICH"
url="http://glaros.dtc.umn.edu/gkhome/metis/parmetis/overview"
arch=('i686' 'x86_64')
license=(custom)
depends=(mpich metis)
makedepends=(cmake)
replaces=(parmetis-mpich2)
source=(https://bitbucket.org/petsc/pkg-parmetis/get/v${_pkgver}.tar.gz)
sha256sums=('071160d45fa588611e90534d28073319035d3650101905a9e508ed2157e155c8')

# "Upstream" is unmaintained and does not reply or apply to critical patches
#source=(http://glaros.dtc.umn.edu/gkhome/fetch/sw/parmetis/parmetis-$pkgver.tar.gz)

build() {
  cd "$srcdir/${_pkgdirname}"
  make config cc=${_prefix}/bin/mpicc mpicc=${_prefix}/bin/mpicc mpicxx=${_prefix}/bin/mpicxx shared=1 prefix=${_prefix}
  make
}

package () {
  cd "$srcdir/${_pkgdirname}"
  make install "DESTDIR=$pkgdir"
}
