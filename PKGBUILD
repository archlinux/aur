# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=ascii-moon
_pkgname=ascii_moon
pkgver=0.3.1
pkgrel=1
pkgdesc="A TUI application written in Rust that displays the moon phase in ASCII art"
arch=('x86_64' 'aarch64')
url="https://github.com/rockydd/ascii_moon"
license=('MIT')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('ac716af882ca0ace2ad251170682ffe5262b0c7de2d2376a13be58e4e70a3094')

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

