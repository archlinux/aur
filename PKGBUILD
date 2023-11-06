# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=quill
pkgver=3.4.0
pkgrel=1
pkgdesc="Asynchronous Low Latency C++ Logging Library"
arch=("x86_64")
url="https://github.com/odygrd/quill"
license=("MIT")
depends=("fmt")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/odygrd/quill/archive/v${pkgver}.tar.gz")
b2sums=("22d0a5df79ae43d0f52c5a7e472d59f16b12cdb35fc7689eecd146a54d90cd5ba236a1853627862338402c95a2ac093131bf8243f8b155005dc10b63da5889d5")

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
