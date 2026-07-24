# Maintainer: skerrix <eskeredzoker371@gmail.com>
pkgname=rfetch
pkgver=0.3.0
pkgrel=7
pkgdesc="Simple fetch tool written in Rust"
arch=('x86_64')
url="https://github.com/skerrixx/rfetch"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'git')

source=("rfetch::git+${url}.git#tag=v${pkgver}")
sha256sums=('972617bb53ccd9685ec3c598c48b46a6dd49d711d98053819212f65ee6c2a15b')

prepare() {
  cd "${srcdir}/rfetch"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/rfetch"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/rfetch"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "${srcdir}/rfetch"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
