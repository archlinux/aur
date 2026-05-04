# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: chn <g897331845@gmail.com>

pkgname=nameof
pkgver=0.10.5
pkgrel=1
pkgdesc="Nameof operator for modern C++,
         simply obtain the name of a variable, type, function, macro, and enum"
arch=("any")
url="https://github.com/Neargye/nameof"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Neargye/nameof/archive/v${pkgver}.tar.gz")
b2sums=("6dbaa5feee05ab7530d6733315e0de42147a079fca0b5b3c56149fe94d62c212f66d3511081bcf7dd878120c26b6671337e00c553024719fa97db9182101860a")

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
