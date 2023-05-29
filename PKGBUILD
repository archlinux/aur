# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=quill
pkgver=2.9.1
pkgrel=1
pkgdesc="Asynchronous Low Latency C++ Logging Library"
arch=("x86_64")
url="https://github.com/odygrd/quill"
license=("MIT")
depends=("fmt")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/odygrd/quill/archive/v${pkgver}.tar.gz")
b2sums=("e860ae4844288951e5eedd0651935ccb29b75640cbd4f35709c6817eae6c407d482b09e3f02dcd2fdd69ee34e370ba46fa84e3195eee73e0a0a52752f804c2be")

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
