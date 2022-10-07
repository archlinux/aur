# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=stegano
pkgver=0.5.2
pkgrel=1
pkgdesc="A CLI tool for steganography. Supports hiding data in PNG images via LSB Encoding."
arch=('x86_64')
url="https://github.com/steganogram/stegano-rs"
license=('GPL3')
depends=('bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('98276505cd562d09122ea5d22c03ca0bd9227723a4591d5cf6bc6397187137197d20455eeb99fdb58b8dbcec784bf22a16fff399db989e401c640a40155f1114')
options=('!lto')

prepare() {
  cd "$pkgname-rs-$pkgver/$pkgname-cli"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-rs-$pkgver/$pkgname-cli"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-rs-$pkgver/$pkgname-cli"
  cargo test --frozen
}

package() {
  cd "$pkgname-rs-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
