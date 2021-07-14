# Maintainer: Shaodong Wang <unclejimbo@qq.com>
pkgname=cgal-headers
_pkgname=CGAL
pkgver=5.3
pkgrel=1
pkgdesc="The Computational Geometry Algorithms Library."
arch=('any')
url='https://www.cgal.org/'
license=('GPL' 'LGPL')
depends=('mpfr' 'gmp' 'boost')
makedepends=('cmake')
source=("https://github.com/CGAL/cgal/releases/download/v${pkgver}/${_pkgname}-${pkgver}-library.tar.xz")
sha512sums=('c78d544f4a7dcad4154dd5196528352a0248fc55aa4437d53fa00a57e03c605645028926d13e64a86e589b48bd788e79be78f2263800567bb7f888d709e59d7e')
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
