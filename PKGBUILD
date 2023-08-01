# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=quill
pkgver=3.3.0
pkgrel=1
pkgdesc="Asynchronous Low Latency C++ Logging Library"
arch=("x86_64")
url="https://github.com/odygrd/quill"
license=("MIT")
depends=("fmt")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/odygrd/quill/archive/v${pkgver}.tar.gz")
b2sums=("b579e5b2998f12daa18efd46a943526e2e90bf13bfe9ab0560e2aff552144fcf867a547ba98c472ce7c2ecd9b59a6b3de548f966fc5caef823292b818fff8f0e")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D QUILL_FMT_EXTERNAL:BOOL="ON" \
    -D QUILL_PKGCONFIG_DIR:PATH="/usr/lib/pkgconfig/" \
    -D BUILD_SHARED_LIBS:BOOL="ON" \
    -D CMAKE_BUILD_TYPE:STRING="Release" \
    -D CMAKE_CXX_FLAGS_RELEASE:STRING="-DNDEBUG" \
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
