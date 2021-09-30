# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lcov-diff
_pkgname=lcov-diff-util
pkgver=0.2.0
pkgrel=1
pkgdesc="Diff utility for LCOV coverage files"
arch=('x86_64')
url="https://github.com/capgelka/lcov-diff"
license=('MIT')
depends=('gcc-libs' 'lcov')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate")
sha512sums=('66af4ff7f6e22401ff7b8a618911e528e3ba5e242c2b5be5f18a007aedc0ed1c4b1c16834aa8d6fa38b4b7b42f64164308a491f7851249d4b53ae79a72529424')
b2sums=('84e86a001f8d6a1c79176c5d827b8507ea9721867f3bd0ac14d1489c2fdfacc4c3eb2902cb12102efefb9e56eeb5d2a6d4e9da09df597669abf386409e9776bd')

prepare() {
  # download dependencies
  cd "$_pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$_pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
