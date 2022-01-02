# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=heliocron
pkgver=0.5.0
pkgrel=2
pkgdesc='Execute tasks relative to sunset, sunrise and other such solar events'
arch=('x86_64')
url=https://github.com/mfreeborn/heliocron
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
b2sums=('93d5b0a0b2ad6141bbb8d893bff3f894382c77a0e79e35adaa09607dddc6eb155720c4f1003e994784e5249557339855c00ed84339c058d7dd79e94a16dd6e09')

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
