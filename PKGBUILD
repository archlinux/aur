# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=heliocron
pkgver=0.7.0
pkgrel=1
pkgdesc='Execute tasks relative to sunset, sunrise and other such solar events'
arch=('x86_64')
url=https://github.com/mfreeborn/heliocron
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
b2sums=('ef8e91e3937c90981f3485d42a10b83add1c8d3e340779958685e0864156820b6d857989f2251c650af63d3302911368272ba7188c94f83917486937c517a71f')

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
