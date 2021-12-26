# Maintainer: Funami
pkgname=cargo-clone
pkgver=0.2.0
pkgrel=1
pkgdesc="A cargo subcommand to fetch the source code of a Rust crate"
arch=('x86_64')
url="https://github.com/JanLikar/cargo-clone"
license=('APACHE' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('c4f88e55208ca93c21a8fdd1cd2be16004e1e2ab4ca4aa3d57acb832e749fdd9')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
