# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pulldown-cmark
pkgver=0.6.1
pkgrel=1
pkgdesc='Pull parser for CommonMark, written in Rust'
arch=('x86_64')
url=https://github.com/raphlinus/pulldown-cmark
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("pulldown-cmark-$pkgver.tar.gz::https://crates.io/api/v1/crates/pulldown-cmark/$pkgver/download")
sha512sums=('bcb619f02dce29e83e14b3b2fc05ed2a3f40a101725bbb3e6ac012b8b4aa0a2a5bd3a8ceb2e2d6e9593c3c243b0f2c0ce287c4feb82b16fc56dcfe3cd43fb75d')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
