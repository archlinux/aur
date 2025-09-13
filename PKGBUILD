# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: chn <g897331845@gmail.com>

pkgname=cista
pkgver=0.16
pkgrel=1
pkgdesc="Simple, high-performance, zero-copy C++ serialization & reflection library"
arch=("any")
url="https://cista.rocks"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/felixguendling/cista/archive/v${pkgver}.tar.gz"
        "https://github.com/felixguendling/cista/releases/download/v${pkgver}/cista.h")
b2sums=("f06ef0883e88c3262f9c182aa4661ea086461ecdb0ae5eee452605c72ab5a0ced69693bca7fa1877ac138a589e67c79a302077285ef4bcb94a39bee4e8d5bccd"
        "161fa4be74015117f832392c72f6d7ecb53d27b62e6c71befe119e0beed9d14754449796d44ffd80e419fbf8853ba4e5473e3e3d285867c4a7b26996230c22ef")

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
