pkgname=cdt
pkgver=2.1.0
pkgrel=1
pkgdesc="Constrained Delaunay Triangulation (C++)"
license=('MPL-2.0')
arch=('any')
url="https://artem-ogre.github.io/CDT/"
depends=()
makedepends=('cmake')
options=('!debug')
source=("https://github.com/artem-ogre/CDT/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4b17289c589fbaf3a961f250809f55a9e6ceccc627fbc36ded3a151c81fa7d43')

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

