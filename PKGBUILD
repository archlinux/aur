# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=stegano
pkgver=0.4.7
pkgrel=1
pkgdesc="CLI tool for steganography. Supports hiding data in PNG images via LSB Encoding."
arch=('x86_64')
url="https://github.com/steganogram/stegano-rs"
license=('GPL3')
depends=('bzip2')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('24258acbedca9761174a48bcb0b2615e2cb2af28ea367f88cbe4509dc7dce1cd5fee77b10af109ab0755eaa3fb940d7c08ac8a99019cccc2665b2076082d952d')

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
