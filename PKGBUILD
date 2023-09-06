# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=snitch
pkgver=1.2.2
pkgrel=1
pkgdesc="Lightweight C++20 testing framework"
arch=("x86_64")
url="https://github.com/cschreib/snitch"
license=("Boost")
depends=("gcc-libs")
makedepends=("cmake" "python")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cschreib/snitch/archive/v${pkgver}.tar.gz")
b2sums=("ad69fef7c15e8b2f65c88aeba3817f1129b21e3e1b83e29f3d042fd92009aa643efd7b3d222753fb489ded747fcfa3011c39f6fd69fa5e1c55382a137fb3fbcf")

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
