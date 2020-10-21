# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termimage
pkgver=1.1.0
pkgrel=1
pkgdesc="Display images in your terminal"
arch=('x86_64')
url="https://github.com/nabijaczleweli/termimage"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/$pkgname-man-v$pkgver.tbz2")
sha512sums=('7a0d957a34ab73ad6c3c96327e82994e9af0b333fd5555f8ccc54c336bb76312db93392468dc9ea94584b71be808581a6cf53b6fc0618af8bce57919cf6f3598'
            '7e2f220b7b023f357c1ee32ac7ed2936e4b01378d8fd2bf96becedb4dd16e8bae4a7eb57790292342beb9512e915e52d782782e04aec28d6d415f6741f241c5b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "../$pkgname-man-v$pkgver/$pkgname.md" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "../$pkgname-man-v$pkgver/$pkgname.1" -t "$pkgdir/usr/share/man/man1"
}
