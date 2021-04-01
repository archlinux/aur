# Maintainer: Shaodong Wang <unclejimbo@qq.com>
pkgname=cgal-headers
_pkgname=CGAL
pkgver=5.2.1
pkgrel=1
pkgdesc="The Computational Geometry Algorithms Library."
arch=('any')
url='https://www.cgal.org/'
license=('GPL' 'LGPL')
depends=('mpfr' 'gmp' 'boost')
makedepends=('cmake')
source=("https://github.com/CGAL/cgal/releases/download/v${pkgver}/${_pkgname}-${pkgver}-library.tar.xz")
sha512sums=('93c73ca43589b24607c07458559891cbe9112f8f5020754f7b77d6bac5d7df497c474d1188fe742584bc9fa49890b4db470514a57e32b8098e88de6db500ee08')
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
