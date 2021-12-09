# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=stegano
pkgver=0.5.0
pkgrel=1
pkgdesc="CLI tool for steganography. Supports hiding data in PNG images via LSB Encoding."
arch=('x86_64')
url="https://github.com/steganogram/stegano-rs"
license=('GPL3')
depends=('bzip2')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c8b2862a87125a6fb9db2582fbcda8e3268c6ca2987a8def8ce0baf5689fe8c407b6214f7bfb0b87c9c0d646fe58bf3eecc1f92c9b8e19564ea3d7cac79c2736')

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
