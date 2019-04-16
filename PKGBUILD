# Maintainer: T. Baumann <arch AT nnamuab DOT de>
pkgname=usgs-phast
_pkgname=phast
pkgver=3.5.0
_pkgsvn=14000
pkgrel=1
pkgdesc="A Computer Program for Simulating Groundwater Flow, Solute Transport, and Multicomponent Geochemical Reactions (no MPI)"
arch=('i686' 'x86_64')
url="http://wwwbrr.cr.usgs.gov/projects/GWC_coupled/phast/"
license=('custom')
depends=('gmp' 'boost-libs' 'gcc-fortran' 'hdf5' 'zlib')
makedepends=('boost')
source=("http://water.usgs.gov/water-resources/software/PHAST/${_pkgname}-${pkgver}-${_pkgsvn}.tar.gz")
md5sums=('2490530f47e0d6dfee77e5cdbcf8f065')

build() {
  cd "$srcdir/$_pkgname-$pkgver-$_pkgsvn"
  ./configure --prefix=/usr \
              --disable-openmp
  make CCFLAGS="-O3 -Wall -ansi -pedantic -DHAVE_ISFINITE -DNDEBUG -mtune=native"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver-$_pkgsvn"

  make DESTDIR="${pkgdir}" install

  # install licence
  mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
  install -m644 NOTICE ${pkgdir}/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
