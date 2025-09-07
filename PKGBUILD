# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=quill
pkgver=10.1.0
pkgrel=1
pkgdesc="Asynchronous Low Latency C++ Logging Library"
arch=("any")
url="https://github.com/odygrd/quill"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/odygrd/quill/archive/v${pkgver}.tar.gz")
b2sums=("7d10327d984a5d50c7162a6c10a17904fce0e23503cf5d686b907edf91f286d1d9882338f6e827f29ba3a2712d4ca8939ffc5f092c785a58d905444fc5e8c6c4")

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
