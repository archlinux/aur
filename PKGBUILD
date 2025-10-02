# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname="leetcode"
pkgname="${_pkgname}-cli"
pkgver=0.4.7
pkgrel=1
epoch=1
pkgdesc="A command line tool to manage LeetCode challenges"
url="https://github.com/clearloop/leetcode-cli"
arch=('any')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('a0b2f4f8d0395f459577f59a77e81412811bf0196cf364a5863719937037dfda2b1fe82ef75cf0509c0f82e62472e0eef2162c8a4533eacf05ab9ade967a6fd4')

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
