# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname=leetcode
pkgname=$_pkgname-cli
pkgver=0.3.11
pkgrel=1
pkgdesc="A command line tool to manage LeetCode challenges"
url="https://crates.io/crates/$pkgname"
# url="https://github.com/clearloop/leetcode-cli"
arch=('any')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('8968000cd24f132e973f183ec8de0f8062b86a373868ad3c8b32695f1079b4fdf05b2a3096252a451a46e5c9b792f483990c351f36deddf31b0f0e86193d6406')

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
