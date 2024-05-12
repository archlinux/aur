# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=snitch
pkgver=1.2.5
pkgrel=1
pkgdesc="Lightweight C++20 testing framework"
arch=("x86_64")
url="https://github.com/snitch-org/snitch"
license=("BSL-1.0")
depends=("gcc-libs")
makedepends=("cmake" "python")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/snitch-org/snitch/archive/v${pkgver}.tar.gz")
b2sums=("4e75258573c997089954a0cf64f2c9dd213b141d70c20d3996523340731d9cf42393e658dc292805d68e3b982176a130cbe53b7d6081664b792f366a2b44aea1")

build() {
  cmake -B "build_shared/" -S "${pkgname}-${pkgver}" \
    -D BUILD_SHARED_LIBS:BOOL="ON" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev
  cmake -B "build_header_only/" -S "${pkgname}-${pkgver}" \
    -D SNITCH_HEADER_ONLY:BOOL="ON" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build_shared/"
  cmake --build "build_header_only/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build_shared/"
  DESTDIR="${pkgdir}" cmake --install "build_header_only/"
}
