# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Mark Pustjens <pustjens@dds.nl>

pkgname=quill
pkgver=12.0.0
pkgrel=1
pkgdesc="Asynchronous Low Latency C++ Logging Library"
arch=("any")
url="https://github.com/odygrd/quill"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/odygrd/quill/archive/v${pkgver}.tar.gz")
b2sums=("d1f0874bc11299a2e8489781e2a875fd75356197e325e55611499cf472f11d75cd3f81498cd8e97e7d75b603f6c49391e9d74de361dbef172ec0ea0a85a019e0")

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
