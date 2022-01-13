# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname=leetcode
pkgname=$_pkgname-cli
pkgver=0.3.10
pkgrel=1
pkgdesc="A command line tool to manage LeetCode challenges"
url="https://crates.io/crates/$pkgname"
# url="https://github.com/clearloop/leetcode-cli"
arch=('any')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('f9bbdcc76022b0cc39e86ce5de9d641cf5faa1dfd91e99d467d80aaed22ec319f71d5fb5bd12bf8ceace9e91a68eb856366de65a2e6384b24ff8fec755c126a2')

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
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}

# vim:set ts=2 sw=2 et:
