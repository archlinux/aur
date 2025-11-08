# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=mdfried
pkgver=0.14.2
pkgrel=1
pkgdesc="A markdown viewer for the terminal that renders images and big headers"
arch=('x86_64')
url="https://github.com/benjajaja/mdfried"
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7c08079450d9659ac2fcd1eb1ff1fb2c3c69727c319a7910b8c9d8d1f8b2878829b7154fbedf37cb619f44176bf27cbfcd90c8679475919d0ef11049f64a7776')
options=('!lto')

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
}
