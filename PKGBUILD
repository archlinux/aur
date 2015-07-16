# Contributor: Jed Brown <jed@59A2.org>
# Maintainer: George Eleftheriou <eleftg>

pkgname=parmetis-mpich
_prefix=/opt/mpich
pkgver=4.0.3
_pkgver=4.0.3-p1
pkgrel=1
pkgdesc="A parallel graph partitioning library, built against MPICH"
url="http://glaros.dtc.umn.edu/gkhome/metis/parmetis/overview"
arch=('i686' 'x86_64')
license="custom"
depends=(mpich metis)
makedepends=(cmake)
replaces=(parmetis-mpich2)
source=(http://ftp.mcs.anl.gov/pub/petsc/externalpackages/parmetis-${_pkgver}.tar.gz)
md5sums=('19dd88554f83bf6fd848e3fb98efd626')
# "Upstream" is unmaintained and does not reply or apply to critical patches
#source=(http://glaros.dtc.umn.edu/gkhome/fetch/sw/parmetis/parmetis-$pkgver.tar.gz)

build() {
  cd "$srcdir/parmetis-$_pkgver"
  make config cc=${_prefix}/bin/mpicc mpicc=${_prefix}/bin/mpicc mpicxx=${_prefix}/bin/mpicxx shared=1 prefix=${_prefix}
  make
}

package () {
  cd "$srcdir/parmetis-$_pkgver"
  make install "DESTDIR=$pkgdir"
}
