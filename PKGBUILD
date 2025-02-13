# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname="leetcode"
pkgname="${_pkgname}-cli"
pkgver=0.4.6
pkgrel=1
epoch=1
pkgdesc="A command line tool to manage LeetCode challenges"
url="https://github.com/clearloop/leetcode-cli"
arch=('any')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('d9ed3e2bc5c90498964fea19f7f8d8a84b7aa3183c6905e409574135535bfecb4e04526724b3e5a77b68f6b1badd1afd5cbbd65eaa0329a5b170bfbf73aedccc')

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
