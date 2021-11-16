# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=stegano
pkgver=0.4.10
pkgrel=1
pkgdesc="CLI tool for steganography. Supports hiding data in PNG images via LSB Encoding."
arch=('x86_64')
url="https://github.com/steganogram/stegano-rs"
license=('GPL3')
depends=('bzip2')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('07cf4af612c2035b4f311ca0ff70d2d18ac643e0c30f389ef448d94f186aba9910157f08c7bd1e38703db0c53b5dddceb1e868ae44a144462608e7288f362c84')

prepare() {
  cd "$pkgname-rs-$pkgver/$pkgname-cli"
  cargo fetch --locked
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
