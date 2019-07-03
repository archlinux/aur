# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=cw-rs
pkgver=0.7.0
pkgrel=1
pkgdesc='Count Words - word, line, character and byte count'
arch=('x86_64')
url=https://github.com/Freaky/cw
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("cw-$pkgver.tar.gz::https://crates.io/api/v1/crates/cw/$pkgver/download")
sha512sums=('4a3c46092fb1bd3ae97f390449394dfedcc3cf6016ba149dca3db486bc7f54f50200a7179c10617d799c7cd38236c9e257961d4f48fcbc4ef90543d81f8d65be')

build() {
  cd cw-$pkgver
  cargo build --release --features runtime-dispatch-simd
}

check() {
  cd cw-$pkgver
  cargo test --release
}

package() {
  cd cw-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/cw
  install -Dm644 -t "$pkgdir"/usr/share/licenses/cw LICENSE.txt
}

# vim:set ts=2 sw=2 et:
