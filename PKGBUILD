# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=jsoncpp-git
pkgver=1.9.4.r35.g94a6220
pkgrel=1
pkgdesc="C++ library for interacting with JSON"
arch=('i686' 'x86_64')
url="https://github.com/open-source-parsers/jsoncpp"
license=('MIT' 'custom')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('jsoncpp' 'libjsoncpp.so')
conflicts=('jsoncpp')
options=('staticlibs')
source=("git+https://github.com/open-source-parsers/jsoncpp.git")
sha256sums=('SKIP')


pkgver() {
  cd "jsoncpp"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "jsoncpp"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "jsoncpp"

  make -C "_build" test
}

package() {
  cd "jsoncpp"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/jsoncpp"
}
