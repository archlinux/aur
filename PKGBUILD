# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=quill
pkgver=2.7.0
pkgrel=1
pkgdesc="Asynchronous Low Latency C++ Logging Library"
arch=("x86_64")
url="https://github.com/odygrd/quill"
license=("MIT")
depends=("fmt")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/odygrd/quill/archive/v${pkgver}.tar.gz")
b2sums=("58bfad354565d256de5ff6f547038e3300ba5f76d3646ed3acc39222bf5ddbc57a01f374f2eebe2c6787079576dae388a183775977ba7fd8c7bfad92a0619154")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D QUILL_FMT_EXTERNAL:BOOL="ON" \
    -D QUILL_PKGCONFIG_DIR:PATH="/usr/lib/pkgconfig/" \
    -D BUILD_SHARED_LIBS:BOOL="ON" \
    -D CMAKE_BUILD_TYPE:STRING="Release" \
    -D CMAKE_CXX_FLAGS_RELEASE:STRING="-O2 -DNDEBUG" \
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
