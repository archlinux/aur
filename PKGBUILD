# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tinyxml-git
pkgver=8.0.0.r42.g1aeb57d
pkgrel=1
pkgdesc="A simple, small, efficient, C++ XML parser"
arch=('i686' 'x86_64')
url="http://grinninglizard.com/tinyxml2/index.html"
license=('zlib')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('tinyxml')
conflicts=('tinyxml')
options=('staticlibs')
source=("git+https://github.com/leethomason/tinyxml2.git")
sha256sums=('SKIP')


pkgver() {
  cd "tinyxml2"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "tinyxml2"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_STATIC_LIBS=ON \
    ./
  make -C "_build"
}

check() {
  cd "tinyxml2"

  make -C "_build" test
}

package() {
  cd "tinyxml2"

  make -C "_build" DESTDIR="$pkgdir" install

  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/tinyxml"
}
