# Maintainer: skerrix <eskeredzoker371@gmail.com>
pkgname=rfetch
pkgver=0.3.0
pkgrel=4
pkgdesc="Simple fetch tool written in Rust"
arch=('x86_64')
url="https://github.com"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/skerrix/rfetch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('df0a354eec1b904a44cd2251b05707aa99a380d7ca8e32178b55844fc0ef5d54')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
