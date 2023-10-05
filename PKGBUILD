# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=snitch
pkgver=1.2.3
pkgrel=1
pkgdesc="Lightweight C++20 testing framework"
arch=("x86_64")
url="https://github.com/cschreib/snitch"
license=("Boost")
depends=("gcc-libs")
makedepends=("cmake" "python")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cschreib/snitch/archive/v${pkgver}.tar.gz")
b2sums=("f77bfe38a498ffb502acd275aec68b347a90e684331f7dfa8329a1cc669512c23d92ef7674b30da9f9d56503efff1affbe77b35b8e64aa821ccbc98d178d3e52")

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
