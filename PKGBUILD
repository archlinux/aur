# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: chn <g897331845@gmail.com>

pkgname=cista
pkgver=0.15
pkgrel=1
pkgdesc="Simple, high-performance, zero-copy C++ serialization & reflection library"
arch=("any")
url="https://cista.rocks"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/felixguendling/cista/archive/v${pkgver}.tar.gz"
        "https://github.com/felixguendling/cista/releases/download/v${pkgver}/cista.h")
b2sums=("aefcc1ba405352bfadacadecc879bf294156ad105de2da024f94ac8129b89784082cf85b4d44945494eb123abed75d6b003b8b93571d40d2595bcf6500d97d0e"
        "4b5cfa4a15d4d70c2f3a559ae54b5db55a43227917cad75d2aa338fcbe453886166c73c2122144a3bd83a508ed8b490dc5973d8676a7fa454231871fa96fd86e")

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
