# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=tickrs
pkgver=0.9.1
pkgrel=1
pkgdesc="Realtime ticker data in your terminal"
arch=('x86_64')
url="https://github.com/tarkah/tickrs"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b053e2ac5e66c45165e0d9b31d47923a09b89c6f1a4dd54d76b090acee288aa34cdde37f05701980363d7dda76b5adbaa8d16e802ce1214f363caea14fe30674')

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
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
