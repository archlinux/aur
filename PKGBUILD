# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=StyLua
pkgname=stylua
pkgver=0.11.0
pkgrel=1
pkgdesc='Code formatter for Lua'
arch=('any')
url=https://github.com/JohnnyMorganz/StyLua
license=('MPL2')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('784617259e662fd0037b9f0e57cbe28a1665dea1728963006212e58a290cbfd947e09dfdfe376eb9b034e0324472ae3714536cd7bbe3363e5d79ecc8d8bbdeea')

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
