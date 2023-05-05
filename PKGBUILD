# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname="proto"
pkgdesc='A multi-language version and dependency manager'
pkgver=0.8.2
pkgrel=1
license=('MIT')
url='https://github.com/moonrepo/proto'
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('dca0e4fb19e7219b1225f8ed3bccb6d517154e757cf537cc5617996a45174ef3717cbb70938bdf2a3018aa1bca79a37a15bddb8a9beaae71c42b369632ad923e')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN="stable"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN="stable"
  export CARGO_TARGET_DIR="target"
  cargo build --release --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
