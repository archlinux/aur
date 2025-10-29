# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=quill
pkgver=10.2.0
pkgrel=1
pkgdesc="Asynchronous Low Latency C++ Logging Library"
arch=("any")
url="https://github.com/odygrd/quill"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/odygrd/quill/archive/v${pkgver}.tar.gz")
b2sums=("202c57d9b417a6875d61619e5f64a5eed3c6c59eeeff6f117dd6a3c24dae8a3038917e00f40779d31365d881254d204d27e0f6de174de8ece7b852883469d0ca")

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
