# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Upstream Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=jsoncpp-cmake
pkgname_=jsoncpp
pkgver=1.9.6
pkgrel=1
pkgdesc="C++ library for interacting with JSON; cmake version: FS#60285"
arch=('x86_64')
url="https://github.com/open-source-parsers/jsoncpp"
license=('MIT' 'custom')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'python')
provides=('jsoncpp' 'libjsoncpp.so')
conflicts=('jsoncpp')
options=('staticlibs')
source=("https://github.com/open-source-parsers/${pkgname_}/archive/${pkgver}/${pkgname_}-${pkgver}.tar.gz")
sha256sums=('f93b6dd7ce796b13d02c108bc9f79812245a82e577581c4c9aabe57075c90ea2')


build() {
  cmake -B build -S "${pkgname_}-${pkgver}" \
  -DCMAKE_INSTALL_PREFIX="/usr" \
  -DCMAKE_INSTALL_SBINDIR="bin" \
  -DJSONCPP_WITH_CMAKE_PACKAGE=ON
  cmake --build build
}

check() {
  cd build
  ctest
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "${pkgname_}-${pkgver}/LICENSE" -t "$pkgdir/usr/share/licenses/jsoncpp"
}
