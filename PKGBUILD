# Maintainer: Michael Cortese <mcortese1406@gmail.com>
pkgname=netwatch-tui
pkgver=0.3.5
pkgrel=2
pkgdesc="Real-time network diagnostics TUI — like htop for your network"
arch=('x86_64')
url="https://github.com/matthart1983/netwatch"
license=('MIT')
depends=('libpcap')
makedepends=('cargo' 'nasm')

options=('!lto')

source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('72e589ece00cff57818901404e290d001931dfe06f46f0cb57a185873320352d')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/netwatch" "$pkgdir/usr/bin/netwatch"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
