# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: chn <g897331845@gmail.com>

pkgname=nameof
pkgver=0.11.0
pkgrel=1
pkgdesc="Nameof operator for modern C++,
         simply obtain the name of a variable, type, function, macro, and enum"
arch=("any")
url="https://github.com/Neargye/nameof"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Neargye/nameof/archive/v${pkgver}.tar.gz")
b2sums=("b65dababf3c20e2105f82d3557ca72ad976be4c86f5f5981562b0f82d0b8d3adfcc7904ce52c773975404b2daba42cf28320070353a65507bfc78d9a488bfb02")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D NAMEOF_OPT_BUILD_EXAMPLES:BOOL="OFF" \
    -D NAMEOF_OPT_BUILD_TESTS:BOOL="OFF" \
    -D NAMEOF_OPT_INSTALL:BOOL="ON" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"

  install -D --target-directory="${pkgdir}/usr/share/licenses/${pkgname}/" \
    --mode=644 \
    "${pkgname}-${pkgver}/LICENSE"
}
