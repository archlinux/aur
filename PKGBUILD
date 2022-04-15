# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rustywind
pkgver=0.14.0
pkgrel=1
pkgdesc='CLI for organizing Tailwind CSS classes'
arch=('x86_64')
url=https://github.com/avencera/rustywind
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('d99de713ffbc80b1fd66acb65a6894456d10342febdd5df6e92486f8d77dac8ab49d25c15db0246a7ec484083a57b2a247c79e802277d6b2bc8e09d53e0da97c')

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
  cargo test --locked --offline
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
}

# vim:set ts=2 sw=2 et:
