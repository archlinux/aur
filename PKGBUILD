# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=snitch
pkgver=1.2.4
pkgrel=1
pkgdesc="Lightweight C++20 testing framework"
arch=("x86_64")
url="https://github.com/snitch-org/snitch"
license=("BSL-1.0")
depends=("gcc-libs")
makedepends=("cmake" "python")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/snitch-org/snitch/archive/v${pkgver}.tar.gz")
b2sums=("cbbe7da4a956a5665ea92e58ef76f499422e9e12c474352fb274220b8da3fdd0de542d778c96625da2dcd42bba8621cc92171604cde5d41c59a01772dc376a06")

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
