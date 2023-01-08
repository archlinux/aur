# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lesspass-client
pkgver=0.3.0
pkgrel=1
pkgdesc='LessPass client library and CLI written in Rust'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/ogarcia/lesspass-client'
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ogarcia/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('a7a641b47c536f1048edabf037d5f834bb7b0d127b7c75bf9e5d735ef456352e703823448868125ded1d03d594ad89a6e89f60135ec5c6df9adc7775bb669d11')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # readme
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
