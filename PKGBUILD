# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=shy
pkgver=0.1.8
pkgrel=1
pkgdesc="Bare-bones SSH launcher"
arch=('x86_64')
url="https://github.com/xvxx/shy"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5f79f3a6b7a9387ba1033196df9ead9ac02d720bcaba2a9cb6b2195871bc01add137028b2cbc4b253a155cc7e98858dcf18b5dc668dc06e7e8607113ef7b5c60')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
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
