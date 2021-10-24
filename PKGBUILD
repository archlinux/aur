# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-make
pkgver=0.35.5
pkgrel=1
pkgdesc="Rust task runner and build tool"
arch=('x86_64')
url="https://github.com/sagiegurari/cargo-make"
license=('Apache')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('ab7c75a860eb1510fa25b9ac952dbf7c0d03ea1f9b43d7e9450831bc953d62f28d962bdab0a39279a1eb4345ce1f784a721540a0bc839587d8fc6d97018ac239')
b2sums=('fb35444dfdc240055f24e2a0660d7235436e7edbb9369dcffc5e96be54525b4911a2002a0b8949b283f94e7c3da43f4464e472657023dd2a9675401be8e6eed3')

prepare() {
  # download dependencies
  cd "$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md
}
