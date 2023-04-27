# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=wthrr
pkgver=1.0.2
pkgrel=1
pkgdesc="Weather companion for the terminal"
arch=('x86_64')
url="https://github.com/tobealive/wthrr-the-weathercrab"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7070893bf896b0b3cd35faab01def27df157d19cb7fca757250e67e30e0f0d314f80b2c4008e50171505543b549e4a117bf0892258366bae52494d217b65c869')

prepare() {
  mv "wthrr-the-weathercrab-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
