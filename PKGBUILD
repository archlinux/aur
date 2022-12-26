# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: chn <g897331845@gmail.com>

pkgname=cista
pkgver=0.11
pkgrel=1
pkgdesc="Simple, high-performance, zero-copy C++ serialization & reflection library"
arch=("any")
url="https://cista.rocks"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/felixguendling/cista/archive/v${pkgver}.tar.gz"
        "https://github.com/felixguendling/cista/releases/download/v${pkgver}/cista.h")
b2sums=("04269d2358745f71fa10e82ac0d15049f2f6e5c2c3d22bc59a2e5e0859306d0cba8e289849d3a06877a9f6efbcf2845aa47eda72f74d39bedfab91e2beeace1c"
        "b3957fd2862a413a2306aec64cfad64bc627801f290d80e39ca601d1de4c927388f2773a1b9f86d51699f34eefd4a3436cde10b96824e518dcc8efdad1b0f980")

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
