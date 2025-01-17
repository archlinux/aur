# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=quill
pkgver=8.0.0
pkgrel=1
pkgdesc="Asynchronous Low Latency C++ Logging Library"
arch=("any")
url="https://github.com/odygrd/quill"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/odygrd/quill/archive/v${pkgver}.tar.gz")
b2sums=("67fdbe9accbea45ae11492050a948a957c3804433208bd56313b2cc7b4d2b57c405eaf2ea1e8bc20e1873853483750985adbe9ae292367dcc2c445bdec7dd847")

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
