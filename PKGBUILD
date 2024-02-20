# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=tenki
pkgver=1.3.0
pkgrel=1
pkgdesc="TTY-clock with weather effect"
arch=('x86_64')
url="https://github.com/ckaznable/tenki"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ecdbed61ed57f8879d627559c48e14c01897660cd6b028df0965d90c2214a9b204c5b45a6cad01e01be3225adc3b709b2246145566885645488f643c2a972dfd')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
