# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=t-rec
pkgver=0.5.1
pkgrel=1
pkgdesc="Blazingly fast terminal recorder"
arch=('x86_64')
url="https://github.com/sassman/t-rec-rs"
license=('GPL3')
depends=('libx11' 'imagemagick')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('127383ae0b981aeaabe44280e56363e98dc262941a81212ee6cce07afd3552e4b38eadf3abf145e78eb57726fc5665207d297d509421c205ae6addd4fa3a2f75')

build() {
  cd "$pkgname-rs-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-rs-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-rs-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
