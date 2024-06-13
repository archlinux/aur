# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=wthrr
pkgver=1.2.0
pkgrel=1
pkgdesc="Weather companion for the terminal"
arch=('x86_64')
url="https://github.com/tobealive/wthrr-the-weathercrab"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('17d2e4e0c24c1474b6485fcfeebe18e919f769856103524827cab0c7b935db6405466e5f95287f02e0479ee9308f231fd9c86e1f3a300c0b12ce91a833f8b41d')

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
