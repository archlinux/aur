# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=StyLua
pkgname=stylua
pkgver=0.12.2
pkgrel=1
pkgdesc='Code formatter for Lua'
arch=('any')
url=https://github.com/JohnnyMorganz/StyLua
license=('MPL2')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('54db4547f5d87dd2675edf333294e89ff99473e4b01a697868665a2d27b9f21bd21c1ff2bd9101c2bf6956156bde95b1166aaaece44a47379a471a5317f69239')

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
