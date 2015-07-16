# Contributor: Jed Brown <jed@59A2.org>
# Maintainer: George Eleftheriou <eleftg>

pkgname=parmetis
pkgver=4.0.3.p1
_pkgver=4.0.3-p1
_prefix=/usr
pkgrel=1
pkgdesc="A parallel graph partitioning library"
url="http://glaros.dtc.umn.edu/gkhome/metis/parmetis/overview"
arch=('i686' 'x86_64')
license="custom"
depends=(metis openmpi)
makedepends=(cmake)
source=(http://ftp.mcs.anl.gov/pub/petsc/externalpackages/parmetis-${_pkgver}.tar.gz)
sha256sums=('e1a20ff927649c4060f22f11c2eab5bb54940b88e57e58bf2e84e28b429606bf')
# "Upstream" is unmaintained and does not reply or apply to critical patches
#source=(http://glaros.dtc.umn.edu/gkhome/fetch/sw/parmetis/parmetis-$pkgver.tar.gz)

build() {
  cd "$srcdir/parmetis-${_pkgver}"
  make config cc=${_prefix}/bin/mpicc mpicc=${_prefix}/bin/mpicc mpicxx=${_prefix}/bin/mpicxx shared=1 prefix=${_prefix}
  make
}

package () {
  cd "$srcdir/parmetis-${_pkgver}"
  make install "DESTDIR=$pkgdir"
}
