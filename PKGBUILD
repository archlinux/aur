# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=ng-log
pkgver=0.8.2
pkgrel=1
pkgdesc="API compatible maintained fork of google-glog application-level logging library"
arch=(x86_64)
url='https://ng-log.github.io/ng-log'
license=(BSD-3-Clause)
depends=(
  gcc-libs
)
makedepends=(
  cmake
  git
)
provides=(google-glog)
conflicts=(google-glog)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ng-log/ng-log/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4d7467025b800828d3b2eb87eb506b310d090171788857601a708a46825953a8')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DWITH_PKGCONFIG=ON \
    -DBUILD_SHARED_LIBS=ON \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
# vim:set ts=2 sw=2 et:
