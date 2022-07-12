# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname=leetcode
pkgname=$_pkgname-cli
pkgver=0.3.12
pkgrel=1
pkgdesc="A command line tool to manage LeetCode challenges"
url="https://crates.io/crates/$pkgname"
# url="https://github.com/clearloop/leetcode-cli"
arch=('any')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('548497d3a1c96afb65f9b5c3a1d38f4bc6f13008647a10dd1686c48d66c8940bf5685da917d1985743f7e819e03794968a9ece29a08e51c72b2f1f2f80d60684')

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
