# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=heliocron
pkgver=0.6.0
pkgrel=1
pkgdesc='Execute tasks relative to sunset, sunrise and other such solar events'
arch=('x86_64')
url=https://github.com/mfreeborn/heliocron
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
b2sums=('a3463a20978fdeba23c8c64ad01193857752bc32f6fd8c9330599075772b33cdb577c758e5154eb194f7431177dcb71b8b2ded7f8c2f44b6de44916543a9a75b')

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
