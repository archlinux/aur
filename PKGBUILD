# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname=leetcode
pkgname=$_pkgname-cli
pkgver=0.4.1
pkgrel=1
epoch=1
pkgdesc="A command line tool to manage LeetCode challenges"
url="https://crates.io/crates/$pkgname"
# url="https://github.com/clearloop/leetcode-cli"
arch=('any')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('1f3ba2733a49fa44d8603c8eed4718ad5f5d52e24be0c69a4d18f4b2d43fa9ae426ae43dc352a8c39e59d234cf4067a3a12414172cac06ac02ccf958c4b13842')

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
