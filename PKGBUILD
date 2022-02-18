# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=StyLua
pkgname=stylua
pkgver=0.12.3
pkgrel=1
pkgdesc='Code formatter for Lua'
arch=('any')
url=https://github.com/JohnnyMorganz/StyLua
license=('MPL2')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('2737e874da37cdcd82d676e2d9b0f242a5573da04f5ccae8edc47d804b338be8dcb76c4813c5f0d8ed079b370835c82ac7e61062b2d2215707fdcf77e5c3cd58')

prepare() {
  cd $_name-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $_name-$pkgver
  cargo build --release --locked --offline --all-features
}

check() {
  cd $_name-$pkgver
  cargo test --locked --offline
  cargo test --locked --offline --features luau
  cargo test --locked --offline --features lua52
}

package() {
  cd $_name-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
}

# vim:set ts=2 sw=2 et:
