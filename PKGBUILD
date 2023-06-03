# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: chn <g897331845@gmail.com>

pkgname=cista
pkgver=0.14
pkgrel=1
pkgdesc="Simple, high-performance, zero-copy C++ serialization & reflection library"
arch=("any")
url="https://cista.rocks"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/felixguendling/cista/archive/v${pkgver}.tar.gz"
        "https://github.com/felixguendling/cista/releases/download/v${pkgver}/cista.h")
b2sums=("a96ed4d6709ef28f4f911275212bc2a8318e93d083a12dbdd39aa5a441190b37172d1ce683bb0433081c045b692803a20a65fea4a186c08f8f7627029a8481be"
        "e0e01c64ec9628a0c7f5bccc98b558b5780ff0e81251e520731fd9ee52609a402fe233518f6a20e7e4829dd7d067e9a8dec62df3685bf7d2e82dc6c5e9ef0a08")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D CISTA_INSTALL:BOOL="ON" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"

  install -D --target-directory="${pkgdir}/usr/include/${pkgname}/" \
    --mode=644 \
    "cista.h"

  install -D --target-directory="${pkgdir}/usr/share/licenses/${pkgname}/" \
    --mode=644 \
    "${pkgname}-${pkgver}/LICENSE"
}
