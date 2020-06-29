# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Hannes Graeuler < hgraeule [at] uos [dot] de >

pkgname=sfcgal
pkgver=1.3.8
pkgrel=1
pkgdesc="Wrapper around the CGAL library that intents to implement 2D and 3D operations on OGC standards models"
arch=('i686' 'x86_64')
url="https://oslandia.github.io/SFCGAL/index.html"
license=('GPL2')
provides=('sfcgal')
depends=('cgal>=4.1' 'boost' 'gmp' 'mpfr' 'openscenegraph')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Oslandia/SFCGAL/archive/v${pkgver}.tar.gz")
sha256sums=('5154bfc67a5e99d95cb653d70d2b9d9293d3deb3c8f18b938a33d68fec488a6d')

build() {
  cd ${srcdir}/SFCGAL-${pkgver}
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
  cd ${srcdir}/SFCGAL-${pkgver}/build
  make DESTDIR=${pkgdir} install
  # Remove conflict with cgal package
  rm -rf ${pkgdir}/usr/include/CGAL
}
