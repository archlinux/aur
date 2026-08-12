pkgname=cdt
pkgver=1.4.5
pkgrel=1
pkgdesc="Constrained Delaunay Triangulation (C++)"
license=('MPL-2.0')
arch=('any')
url="https://artem-ogre.github.io/CDT/"
depends=()
makedepends=('cmake')
options=('!debug')
source=("https://github.com/artem-ogre/CDT/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5b964a00147d17f5d6ffd9c800d4f12f1e540ce8e932655469f65aea9a3005d7')

prepare () {
  cd CDT-$pkgver/CDT
  sed -i "s|DESTINATION cmake)|DESTINATION lib/cmake/CDT)|g" CMakeLists.txt
}

build() {
  cd CDT-$pkgver/CDT
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -B build .
  cmake --build build
}

package() {
  cd CDT-$pkgver/CDT
  DESTDIR="$pkgdir" cmake --build build --target install
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 "$srcdir"/CDT-$pkgver/CDT/LICENSE $pkgdir/usr/share/licenses/$pkgname
}

