# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=mdfried
pkgver=0.12.1
pkgrel=1
pkgdesc="A markdown viewer for the terminal that renders images and big headers"
arch=('x86_64')
url="https://github.com/benjajaja/mdfried"
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0f271e944f6e1d906ea3ed6f2c96df11f7d529bb14be26d0d4470d46bc247f17e72b7c1247f3b7adea9dbf9a3f2237a1fff52a95118b70ab530ab4355f6faa83')
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
