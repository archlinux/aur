# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname="leetcode"
pkgname="${_pkgname}-cli"
pkgver=0.5.5
pkgrel=1
epoch=1
pkgdesc="A command line tool to manage LeetCode challenges"
url="https://github.com/clearloop/leetcode-cli"
arch=('any')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('c4a2905b39f56618c12327d0a56fa72cc0128ab25798a944c1353f45723fc1ad3e0143e9a02a02a72778e0402657542bb129833bd64dd10c46e81af0446e01d2')

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
