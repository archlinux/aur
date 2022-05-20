# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Hannes Graeuler < hgraeule [at] uos [dot] de >

pkgname=sfcgal
pkgver=1.4.1
pkgrel=2
pkgdesc="Wrapper around the CGAL library that intents to implement 2D and 3D operations on OGC standards models"
arch=('i686' 'x86_64')
url="https://gitlab.com/Oslandia/SFCGAL"
license=('GPL3')
provides=('sfcgal')
depends=('cgal' 'boost' 'gmp' 'mpfr' 'openscenegraph')
replaces=('sfcgal')
makedepends=('git' 'cmake')
source=("https://gitlab.com/Oslandia/SFCGAL/-/archive/v${pkgver}/SFCGAL-v${pkgver}.tar.gz")
sha256sums=('1800c8a26241588f11cddcf433049e9b9aea902e923414d2ecef33a3295626c3')

build() {
  cd "${srcdir}/SFCGAL-v${pkgver}"
  mkdir -p build && cd build
  cmake -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSFCGAL_BUILD_EXAMPLES=1 \
    -DSFCGAL_BUILD_TESTS=0 \
    ..
  make
}

package() {
  cd ${srcdir}/SFCGAL-v${pkgver}/build
  make DESTDIR=${pkgdir} install
  # Remove conflict with cgal package
  rm -rf ${pkgdir}/usr/include/CGAL
}
