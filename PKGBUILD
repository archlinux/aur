# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname="leetcode"
pkgname="${_pkgname}-cli"
pkgver=0.4.5
pkgrel=1
epoch=1
pkgdesc="A command line tool to manage LeetCode challenges"
url="https://github.com/clearloop/leetcode-cli"
arch=('any')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('e396660999e34858baa3970fbd9a05771ac9eb0d7f9ddec500e56d5260f90f9cfe5f9fa83b4b5530e39f316fa9bef218f1c45e451e5401b4bceea78302c0cad6')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}

# vim:set ts=2 sw=2 et:
