# Maintainer: Funami
pkgname=cargo-nono
pkgver=0.1.9
pkgrel=2
pkgdesc="A cargo subcommand to detect (possible) no_std compatibility of your crate and dependencies"
arch=('x86_64')
url="https://github.com/hobofan/cargo-nono"
license=('APACHE' 'MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('d197cd6cea7c40ae9ad969d7bd1cc79573c3cbe9619cfd201fcba7bfaf29dc0a')

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
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
