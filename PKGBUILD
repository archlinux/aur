# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=himalaya
pkgver=0.3.1
pkgrel=1
pkgdesc="Minimalist CLI email client, written in Rust"
arch=('x86_64')
url="https://github.com/soywod/himalaya"
license=('BSD')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('1fdabbaba0fc7ffb23676ff76ab081fc1a561eb380fbcc0440dbeab678b5d4e628529e16d91888c0df71221c34ef767164622acf0c373be3a5943a376ea23747')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
