# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Funami
pkgname="cargo-ramdisk"
pkgver=0.2.2
pkgrel="1"
pkgdesc="A cargo subcommand to create the target folder as a RAM disk for faster Rust compilation"
arch=('x86_64')
url="https://github.com/PauMAVA/cargo-ramdisk"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('7919e995c4836c069f1684e6b4eb21b35ba326531040a541a8744fb7f58e6bc3')

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
