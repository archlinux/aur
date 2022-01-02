# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rustywind
pkgver=0.12.2
pkgrel=2
pkgdesc='CLI for organizing Tailwind CSS classes'
arch=('x86_64')
url=https://github.com/avencera/rustywind
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('bf6aba204645b8ae0852cc52e23449ced257ec7bda6cd39da96aee66cfc45617307cf8a7a0b4e4f1cd45e489387112fd6d1ce6b00561e95194c887be9b4f0931')

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
