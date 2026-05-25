# Maintainer: T. Baumann <arch AT nnamuab DOT de>
pkgname=usgs-phast
_pkgname=phast
pkgver=3.9.0
_pkgsvn=17591
pkgrel=1
pkgdesc="A Computer Program for Simulating Groundwater Flow, Solute Transport, and Multicomponent Geochemical Reactions (no MPI)"
arch=('i686' 'x86_64')
url="http://wwwbrr.cr.usgs.gov/projects/GWC_coupled/phast/"
license=('custom')
depends=('gmp' 'boost-libs' 'gcc-fortran' 'hdf5' 'zlib')
makedepends=('boost')
source=("https://github.com/phreeqc-dev/phast3/releases/download/v${pkgver}/phast-${pkgver}-${_pkgsvn}.tar.gz")
md5sums=('1ee3bb847d5f816738e41d081d44ea9a')

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
