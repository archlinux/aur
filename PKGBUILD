# Maintainer: Shaodong Wang <unclejimbo@qq.com>
pkgname=cgal-headers
_pkgname=CGAL
pkgver=5.2
pkgrel=1
pkgdesc="The Computational Geometry Algorithms Library."
arch=('any')
url='https://www.cgal.org/'
license=('GPL' 'LGPL')
depends=('mpfr' 'gmp' 'boost')
makedepends=('cmake')
source=("https://github.com/CGAL/cgal/releases/download/v${pkgver}/${_pkgname}-${pkgver}-library.tar.xz")
sha512sums=('de066887fe84eb7c2a4edf61422ab7a4af1443c60e4ae65fa4d8a5c5edcf8e93879a144e37044f8c093c00e0dcc1fc3fd3cb589ea4c51a2493467e05c9463a9e')
provides=('cgal')
conflicts=('cgal')

prepare () {
  mkdir -p "${srcdir}/${_pkgname}-${pkgver}/build"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  cmake ../ \
  -DCGAL_HEADER_ONLY=ON \
  -DWITH_CGAL_Core=OFF \
  -DWITH_CGAL_ImageIO=OFF \
  -DWITH_CGAL_Qt5=OFF \
  -DBUILD_SHARED_LIBS=OFF \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
}
