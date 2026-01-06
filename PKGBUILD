# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=ascii-moon
_pkgname=ascii_moon
pkgver=0.4.0
pkgrel=1
pkgdesc="A TUI application written in Rust that displays the moon phase in ASCII art"
arch=('x86_64' 'aarch64')
url="https://github.com/rockydd/ascii_moon"
license=('MIT')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('8f785525e86cf3a1200a6c5ca716fce96d76fe7d8984799e7a8de97910e42867')

prepare() {
  cd "${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "${_pkgname}-${pkgver}"

  # Install the binary
  install -Dm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin"

  # Install documentation
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

