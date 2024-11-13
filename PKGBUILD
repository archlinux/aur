# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=quill
pkgver=7.5.0
pkgrel=1
pkgdesc="Asynchronous Low Latency C++ Logging Library"
arch=("any")
url="https://github.com/odygrd/quill"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/odygrd/quill/archive/v${pkgver}.tar.gz")
b2sums=("aa5b83845440fd09fb612f3334b60c45699b986010b5087fd605c5eeb5a03c5f0b70f4b08c1a6e76b02e0345cdbb1db70c8cbe26be3b9a1911618909b7d7a48d")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D QUILL_PKGCONFIG_DIR:PATH="/usr/lib/pkgconfig/" \
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
