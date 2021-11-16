# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=StyLua
pkgname=stylua
pkgver=0.11.2
pkgrel=1
pkgdesc='Code formatter for Lua'
arch=('any')
url=https://github.com/JohnnyMorganz/StyLua
license=('MPL2')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('979d0666b17def8f854837c164d64baf496280fe000622d7a63bfaf282053f01b1991ab9f5d4416da627ea9b4dc2bd0b267ac84e4a48e19dd244cf147dc9dbec')

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
