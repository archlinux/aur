# Maintainer: Maik Broemme <mbroemme@libmpq.org>
pkgname="vdi-stream-client"
pkgdesc="A tiny and low latency desktop streaming client for remote Windows guests with GPU passthrough"
pkgver="0.1.0"
pkgrel="1"
arch=("x86_64")
url="https://libmpq.org/"
license=("GPL")
depends=("sdl2" "sdl2_ttf" "usbredir")
source=(
  "https://github.com/mbroemme/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "https://github.com/parsec-cloud/parsec-sdk/archive/5.0.tar.gz"
)
sha256sums=(
  "693a8a644e0146b5b392ad2bd7f9503ffc0b9a7a5e98dedef392262b216a763f"
  "d0b3f46f5b67830f6e38d7417e92ed8bf34d2e8d7508fa796454a0214cdb7452"
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mv ../parsec-sdk-5.0 parsec-sdk
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
