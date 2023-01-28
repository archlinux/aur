# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: chn <g897331845@gmail.com>

pkgname=cista
pkgver=0.12
pkgrel=1
pkgdesc="Simple, high-performance, zero-copy C++ serialization & reflection library"
arch=("any")
url="https://cista.rocks"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/felixguendling/cista/archive/v${pkgver}.tar.gz"
        "https://github.com/felixguendling/cista/releases/download/v${pkgver}/cista.h")
b2sums=("61876cdbf2b149916a600eb4300f4481688614f9dee82bde4a6d0450966511860009abcc16e08f7019c781e127fcf1efb217106b1ad2a0e55452ed1c161fdf8b"
        "9c50b53154222f310e8e951dc1fb96422dcd933464af7210e0e5e584340b9ce259ce11a015e8bb3822de9f2ef1a5bf18b2cf003e0d571bc7a3553b85a59944a2")

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
