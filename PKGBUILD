# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=proto
pkgdesc='A multi-language version and dependency manager'
pkgver=0.12.1
pkgrel=1
license=('MIT')
url='https://github.com/moonrepo/proto'
arch=('x86_64')
depends=('git')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3d0e9bbed5f8f7c6b41f4d04371758514f6970e9222c2e91d431b2e3ebc30b83783bc2690e3523a8b973c77e50e07714a8f94a5f64666b1f494edb643993f092')

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
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
