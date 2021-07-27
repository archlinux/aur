# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=selene
pkgname=selene-linter
pkgver=0.13.0
pkgrel=1
pkgdesc='Blazing-fast modern Lua linter written in Rust'
arch=('any')
url=https://github.com/Kampfkarren/selene
license=('MPL2')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('a87423585adf3073d4cc560bdf4f924a90bcba7c29f5cd696a8ccaf4fc60e5240fd5995e4ff9ef9534f508f186891aa41db9f9ce3f6a609a7d84e72c4b78996e')

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
