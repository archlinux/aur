# Maintainer: Funami
pkgname=cargo-ramdisk
pkgver=0.1.1
pkgrel=1
pkgdesc="A cargo subcommand to create the target folder as a RAM disk for faster Rust compilation"
arch=('x86_64')
url="https://github.com/PauMAVA/cargo-ramdisk"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('7285dbc44b29ca24dfc1fa3040f7bd5dd3d784ddc38d3e4e061adba2a8f5df6a')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
