# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=selene
pkgname=selene-linter
pkgver=0.14.0
pkgrel=1
pkgdesc='Blazing-fast modern Lua linter written in Rust'
arch=('x86_64')
url=https://github.com/Kampfkarren/selene
license=('MPL2')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$url/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('1033f2ca41ca101b5e676a4036bf96c5fd376b38fcb315e4e3ee3b2c541dda47e6ee8955a43a058a7ada59f15c43e4fe65deff63d686ebafc4b88f1452e5d1d4')

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
  install -Dt "$pkgdir"/usr/bin target/release/$_name
}

# vim:set ts=2 sw=2 et:
