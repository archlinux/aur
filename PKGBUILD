# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=stegano
pkgver=0.4.1
pkgrel=1
pkgdesc="CLI tool for steganography. Supports hiding data in PNG images via LSB Encoding."
arch=('x86_64')
url="https://github.com/steganogram/stegano-rs"
license=('GPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('1f5dd7bf0200848c914f271807f6313cf32495a2b0cfcf95f9ad99f1c9a85f3e31aa0b8275e30fdfb0d20945aee1a35707cadb9e751129c501d8b7357d0e99e8')

build() {
  cd "$pkgname-rs-$pkgver/$pkgname-cli"
  cargo build --release --locked
}

package() {
  cd "$pkgname-rs-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
