# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=StyLua
pkgname=stylua
pkgver=0.11.3
pkgrel=1
pkgdesc='Code formatter for Lua'
arch=('any')
url=https://github.com/JohnnyMorganz/StyLua
license=('MPL2')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('1656958c11a4d4e4a35b935d9b0f4253c50955d8f2d1a955f6c214554df60c612d9b7653009746e5ffd999a5521456cdfe2cc983a4f95ec30181d3b7a450ba20')

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
