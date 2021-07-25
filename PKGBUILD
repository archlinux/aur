# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=b3sum
pkgver=1.0.0
pkgrel=1
pkgdesc='Command line implementation of the BLAKE3 hash function'
arch=('x86_64')
url=https://github.com/BLAKE3-team/BLAKE3
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("b3sum-$pkgver.tar.gz::https://crates.io/api/v1/crates/b3sum/$pkgver/download")
b2sums=('d5c2ed570c921dd5f1b43165e9e8e356e9ded1bdfe365f7663fa31964093ba3bb2fb45f9c6c03b5651fceb2634b805200ef498e71143d4cbda87f14bcfa606b2')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked
}

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
}

# vim:set ts=2 sw=2 et:
