# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pulldown-cmark
pkgver=0.9.0
pkgrel=1
pkgdesc='Pull parser for CommonMark, written in Rust'
arch=('x86_64')
url=https://github.com/raphlinus/pulldown-cmark
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("pulldown-cmark-$pkgver.tar.gz::https://crates.io/api/v1/crates/pulldown-cmark/$pkgver/download")
sha512sums=('57151704ea4e46138b5712d32a67600569615886d7b9f1329324bac2e26ec5cbee3a3db1634348b485bc39e8ccd4531ece3ae377efcce9a4b8e128cdad9792bd')
b2sums=('b627deaf477b27eabb1086f2d4b81450e8d9247c6fb931514e87c9d7b49850bb38bf4aaa8738cf6a74214f00260804c0bbd001e3150c8cd3bde1edd07c173eaf')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  cargo build --frozen --release
}

check() {
  cd $pkgname-$pkgver
  cargo test --frozen
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
