# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=StyLua
pkgname=stylua
pkgver=0.10.1
pkgrel=1
pkgdesc='Code formatter for Lua'
arch=('any')
url=https://github.com/JohnnyMorganz/StyLua
license=('MPL2')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('3950ce0865ea31d5ffa14b0f4a0fbfe6731e856df2ce219cd8ed120517f27ee98e9e7523e73c5edf841d117b5146cc442ca0ef6efa75b43e815243bdf952ab18')

prepare() {
  cd $_name-$pkgver
  cargo fetch --locked
}

build() {
  cd $_name-$pkgver
  cargo build --release --locked --offline
}

check() {
  cd $_name-$pkgver
  cargo test --release --locked --offline
}

package() {
  cd $_name-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
}

# vim:set ts=2 sw=2 et:
