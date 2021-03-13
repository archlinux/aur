# Maintainer: Endlesseden <eden AT rose DOT place>
# Upstream Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=jsoncpp-cmake-git
pkgver=1.9.4.r21.g1ee39a6
pkgrel=1
pkgdesc="C++ library for interacting with JSON; cmake version: FS#60285"
arch=('i686' 'x86_64')
url="https://github.com/open-source-parsers/jsoncpp"
license=('MIT' 'custom')
depends=('gcc-libs')
makedepends=('git' 'meson' 'python')
provides=('jsoncpp')
conflicts=('jsoncpp' 'jsoncpp-git')
options=('staticlibs')
source=("git+https://github.com/open-source-parsers/jsoncpp.git")
sha256sums=('SKIP')


pkgver() {
  cd "jsoncpp"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "jsoncpp"
  if [ -d build ]; then
  rm -r build
  fi
  mkdir build && cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
  -DCMAKE_INSTALL_SBINDIR="bin" \
  -DJSONCPP_WITH_CMAKE_PACKAGE=ON ..
  make
}

check() {
  cd "jsoncpp"

  cd "build"
  ctest
}

package() {
  cd "jsoncpp"/"build"

  DESTDIR="$pkgdir" make install
  install -Dm644 "../LICENSE" -t "$pkgdir/usr/share/licenses/jsoncpp"
}
