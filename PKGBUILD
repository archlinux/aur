# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname="leetcode"
pkgname="${_pkgname}-cli"
pkgver=0.5.4
pkgrel=1
epoch=1
pkgdesc="A command line tool to manage LeetCode challenges"
url="https://github.com/clearloop/leetcode-cli"
arch=('any')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('bc0d761ed61b3dd312565ae76fe1ea3c4149520a7fe18657fd627b449be00c4bbdad4c3aaebb4f3d7a6cd84b583a926b889e95aedc3cf9506206edd08116ee08')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}
#
# check() {
#   cd "$pkgname-$pkgver"
#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --all-features
# }

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
