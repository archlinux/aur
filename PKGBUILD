# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=stegano
pkgver=0.5.1
pkgrel=1
pkgdesc="A CLI tool for steganography. Supports hiding data in PNG images via LSB Encoding."
arch=('x86_64')
url="https://github.com/steganogram/stegano-rs"
license=('GPL3')
depends=('bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e48e6177d1e59651d4e519423f64081aa83a8c9282e1d6bd8668e381022690c0ca654be8ef33c1a5b3b58045194d10ac16ffe123467b6b660768e4fa2ac8528d')
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
