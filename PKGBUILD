# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=snitch
pkgver=1.2.1
pkgrel=1
pkgdesc="Lightweight C++20 testing framework"
arch=("x86_64")
url="https://github.com/cschreib/snitch"
license=("Boost")
depends=("gcc-libs")
makedepends=("cmake" "python")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cschreib/snitch/archive/v${pkgver}.tar.gz")
b2sums=("19686c91cb95fe4690c087f3fe5f9e8b877c1a8aeaaf9f2ea136b380ac8eb9abfb6e3cb3ec89bb121c542c6a625bd8db1a5518083db440406af5c238c63cfed5")

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
