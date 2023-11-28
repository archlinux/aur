# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=quill
pkgver=3.5.0
pkgrel=1
pkgdesc="Asynchronous Low Latency C++ Logging Library"
arch=("x86_64")
url="https://github.com/odygrd/quill"
license=("MIT")
depends=("fmt")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/odygrd/quill/archive/v${pkgver}.tar.gz")
b2sums=("0509b48d683cd5777b22ad0774a43090aae9b865e25314e39a3edc4af17807241a7c9177cb60f4abde8428a665cc745a78251bcc8a73b91b64577bbfdf2b6b2f")

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
