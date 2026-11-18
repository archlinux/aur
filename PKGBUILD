# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: chn <g897331845@gmail.com>

pkgname=nameof
pkgver=0.12.0
pkgrel=1
pkgdesc="Nameof operator for modern C++,
         simply obtain the name of a variable, type, function, macro, and enum"
arch=("any")
url="https://github.com/Neargye/nameof"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Neargye/nameof/archive/v${pkgver}.tar.gz")
b2sums=("b867d4a3a79720d4c495f7661ffb9d434d1dbe15844787c20f6cfc163f87f4f3576b934d6732c54f131c63c1be73173883f826f9d7c5be9089b259fb811e8115")

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
