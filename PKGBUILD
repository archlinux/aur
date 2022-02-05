# Maintainer: T. Baumann <arch AT nnamuab DOT de>
pkgname=usgs-phast
_pkgname=phast
pkgver=3.7.3
_pkgsvn=15968
pkgrel=1
pkgdesc="A Computer Program for Simulating Groundwater Flow, Solute Transport, and Multicomponent Geochemical Reactions (no MPI)"
arch=('i686' 'x86_64')
url="http://wwwbrr.cr.usgs.gov/projects/GWC_coupled/phast/"
license=('custom')
depends=('gmp' 'boost-libs' 'gcc-fortran' 'hdf5' 'zlib')
makedepends=('boost')
source=("http://water.usgs.gov/water-resources/software/PHAST/${_pkgname}-${pkgver}-${_pkgsvn}.tar.gz")
md5sums=('3d9dc5f1e9c6dfa433941948f73dd849')

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
