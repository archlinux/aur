# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=ascii_moon
pkgver=0.3.2
pkgrel=1
pkgdesc="A TUI application written in Rust that displays the moon phase in ASCII art"
arch=('x86_64' 'aarch64')
url="https://github.com/rockydd/ascii_moon"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('17c35528abedae5ce90b3777631692665d689f394aaea698c6d4aee004d399b0')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"

  # Install the binary
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"

  # Install documentation
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

