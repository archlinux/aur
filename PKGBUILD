# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=stegano
pkgver=0.4.9
pkgrel=1
pkgdesc="CLI tool for steganography. Supports hiding data in PNG images via LSB Encoding."
arch=('x86_64')
url="https://github.com/steganogram/stegano-rs"
license=('GPL3')
depends=('bzip2')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0555057bfde3a7e4ec570987aca0a274a3612712b91293c94888618b89c12fcf3c4e7e588e300a8b5b2623a6514038fa1777763467b62f075143c572839818ea')

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
