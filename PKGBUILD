# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: chn <g897331845@gmail.com>

pkgname=nameof
pkgver=0.10.6
pkgrel=1
pkgdesc="Nameof operator for modern C++,
         simply obtain the name of a variable, type, function, macro, and enum"
arch=("any")
url="https://github.com/Neargye/nameof"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Neargye/nameof/archive/v${pkgver}.tar.gz")
b2sums=("1ab8ea946028156d845bfe7248e8b6690e7248910e8775d250bd4e53c751949365718c8f4e6f5fab002f7eaa187748ea7744d2bc16edd1f6d0fd5b36df207ade")

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
