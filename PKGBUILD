# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=snitch
pkgver=1.3.1
pkgrel=1
pkgdesc="Lightweight C++20 testing framework"
arch=("x86_64")
url="https://github.com/snitch-org/snitch"
license=("BSL-1.0")
depends=("gcc-libs")
makedepends=("cmake" "python")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/snitch-org/snitch/archive/v${pkgver}.tar.gz")
b2sums=("f3496264a40728273c18e21c888a80bf04f07f1ce048c61b89ba24c2eccd9879ed30f7a7181a136438eb1b675af71813137e8619c2d8fa60dfe50119d0955475")

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
