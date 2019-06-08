# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tinyxml2-git
pkgver=7.0.1.r8.g61a4c7d
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

  mkdir -p "_build" && cd "_build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    "../"
  make
}

check() {
  cd "tinyxml2"

  make check
}

package() {
  cd "tinyxml2"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/tinyxml2"
}
