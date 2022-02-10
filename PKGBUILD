# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rustywind
pkgver=0.13.0
pkgrel=1
pkgdesc='CLI for organizing Tailwind CSS classes'
arch=('x86_64')
url=https://github.com/avencera/rustywind
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('f50aa4d224ad304620c732a97421dfeed7b2bc8d4a18c7971b0d276dd0098dd696b90191a16e4b7660166f2294d3d4ba657ed1c9bf138e36ba6d2365bf842fa7')

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
