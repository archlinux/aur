# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname=leetcode
pkgname=$_pkgname-cli
pkgver=0.4.3
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
sha512sums=('22e7bdb1d4a40214b0fecec06e0d0ec5096190fd496def3ebcefbd28ec768db9843839992c270e921078d0f4a1c70293c22bd812f1f333071cc06a338ebc8fee')

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
