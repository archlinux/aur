# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tinyxml2-git
pkgver=8.0.0.r42.g1aeb57d
pkgrel=1
pkgdesc="Simple, small, efficient, C++ XML parser"
arch=('i686' 'x86_64')
url="http://www.grinninglizard.com/tinyxml2/"
license=('zlib')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('tinyxml2')
conflicts=('tinyxml2')
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
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/tinyxml2"
}
