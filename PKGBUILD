# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=heliocron
pkgver=0.6.1
pkgrel=1
pkgdesc='Execute tasks relative to sunset, sunrise and other such solar events'
arch=('x86_64')
url=https://github.com/mfreeborn/heliocron
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
b2sums=('2a807d96f523137a9cb27a37d5e9943b7466a5ce429eff17295a8aefa5a3d1db13632e28f5667859bfb0d6b588260297124208542d633bdc8022e66f1ac4249f')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked --offline
}

check() {
  cd $pkgname-$pkgver
  cargo test --locked --offline --features integration-test
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
