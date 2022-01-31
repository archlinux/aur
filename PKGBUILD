# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=selene
pkgname=selene-linter
pkgver=0.16.0
pkgrel=1
pkgdesc='Blazing-fast modern Lua linter written in Rust'
arch=('x86_64')
url=https://github.com/Kampfkarren/selene
license=('MPL2')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$url/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('d322c76ee4fe81d33641741d2f012b048b7bcb60c7722d6e1914004a4528a9ba9b248760e345e86f2a6365d177c622e0bc244020044eb86c7762791a419f79c2')

prepare() {
  cd $_name-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $_name-$pkgver
  cargo build --release --locked --offline
}

check() {
  cd $_name-$pkgver
  cargo test --locked --offline
}

package() {
  cd $_name-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$_name
}

# vim:set ts=2 sw=2 et:
