# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=StyLua
pkgname=stylua
pkgver=0.12.1
pkgrel=1
pkgdesc='Code formatter for Lua'
arch=('any')
url=https://github.com/JohnnyMorganz/StyLua
license=('MPL2')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('116addd061afe1f83fe8d2402c3cdbc7ec52a3bbae007461ac2cbaaed92d09b6f0bf3da042ccbc3c8dc3e7910449ff11633edaa86a1143938cb393afcfdc02b3')

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
