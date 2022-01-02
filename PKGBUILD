# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=selene
pkgname=selene-linter
pkgver=0.15.0
pkgrel=2
pkgdesc='Blazing-fast modern Lua linter written in Rust'
arch=('x86_64')
url=https://github.com/Kampfkarren/selene
license=('MPL2')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$url/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('b18764d28691a1977041cdd35c5ba34efb52f5c0582e904309edc3820dc5626416f1d22f6ebbb0c7f321cc2bb1cff1f52c85c2476a3d8e206298570b7da53772')

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
