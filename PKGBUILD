# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Hannes Graeuler < hgraeule [at] uos [dot] de >

pkgname=sfcgal
pkgver=1.5.1
pkgrel=1
pkgdesc="Wrapper around the CGAL library that intents to implement 2D and 3D operations on OGC standards models"
arch=('i686' 'x86_64')
url="https://gitlab.com/Oslandia/SFCGAL"
license=('GPL3')
provides=('sfcgal')
depends=('cgal' 'boost-libs' 'gmp' 'mpfr' 'openscenegraph')
#replaces=('sfcgal')
makedepends=('git' 'cmake' 'boost')
source=("https://gitlab.com/Oslandia/sfcgal/-/archive/v${pkgver}/SFCGAL-v${pkgver}.tar.gz")
sha256sums=('ea5d1662fada7de715ad564dc810c3059024ed81ae393f5352489f706fdfa3b1')

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
