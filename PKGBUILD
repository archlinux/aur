# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=stegano
pkgver=0.4.6
pkgrel=1
pkgdesc="CLI tool for steganography. Supports hiding data in PNG images via LSB Encoding."
arch=('x86_64')
url="https://github.com/steganogram/stegano-rs"
license=('GPL3')
depends=('bzip2')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a7f828972a1df9d399386112dc4f8e673cbc0fee926b0460ac3de62e9af5c6449049d39bdf6a7c31d612a7fea789e087fb2d887e58de4e6b613133505d544037')

build() {
  cd "$pkgname-rs-$pkgver/$pkgname-cli"
  cargo build --release --locked
}

check() {
  cd "$pkgname-rs-$pkgver/$pkgname-cli"
  cargo test --release --locked
}

package() {
  cd "$pkgname-rs-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
