# Maintainer: Mathieu Fenniak <mathieu@fenniak.net>
pkgname=csv-to-clipboard
pkgver=1.0.2
pkgrel=1
pkgdesc="Copy CSV files onto the clipboard in a pasteable format"
arch=('x86_64')
url="https://github.com/mfenniak/csv-to-clipboard"
license=('MIT')
depends=('gtk3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mfenniak/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('58a7d005a89e4cd3e9bf071c35b400e97ce177c6e9e62e342d0e2c8fe995d582eee404d364734bea4a87a6fc73c5ed5273ed1243789d7bc0ec23052ba415c782')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked 
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/csv-to-clipboard" "$pkgdir/usr/bin/csv-to-clipboard"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
