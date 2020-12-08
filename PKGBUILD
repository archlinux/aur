# Maintainer: Shaodong Wang unclejimbo@qq.com
pkgname=cgal-headers
_pkgname=CGAL
pkgver=5.1.1
pkgrel=1
pkgdesc="The Computational Geometry Algorithms Library."
arch=('any')
url='https://www.cgal.org/'
license=('GPL' 'LGPL')
depends=('mpfr' 'gmp' 'boost')
makedepends=('cmake')
source=("https://github.com/CGAL/cgal/releases/download/v${pkgver}/${_pkgname}-${pkgver}-library.tar.xz")
sha512sums=('3abbc92ae320765a4c4bd9980ff24af0d3484c4ed298f201e75b4cf44df47562d1c649b2edebb1b4a74bd3c57784d64536de2d1e03ad4e34aa8e394b722e03c3')
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
