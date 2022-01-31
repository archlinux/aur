# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=StyLua
pkgname=stylua
pkgver=0.12.0
pkgrel=1
pkgdesc='Code formatter for Lua'
arch=('any')
url=https://github.com/JohnnyMorganz/StyLua
license=('MPL2')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('a81eedcd6b189a4228a4f1255c0d111e0ed93eb90f111012e4a37419e21b79c962a214fe81a00a8796a8a8686891029eb4fafcb25e1a66c9c9cdb22f443a95fd')

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
