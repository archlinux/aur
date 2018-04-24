# Maintainer: Moritz Kiefer <moritz.kiefer@purelyfunctional.org>
pkgname=libcbor
pkgver=0.5.0
pkgrel=1
pkgdesc="A C library for parsing and generating CBOR, the general-purpose schema-less binary data format."
arch=('i686' 'x86_64')
url="https://github.com/PJK/libcbor"
license=('MIT')
depends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}.zip::https://github.com/PJK/libcbor/archive/v${pkgver}.zip")
sha256sums=('2b9ead7d7b4b9213b30cc43f1da8e4006276b640e82321e37590aae3d7a9aa9b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR='lib' -DCMAKE_BUILD_TYPE=Release
  make cbor cbor_shared
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}/" install
}
