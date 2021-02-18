# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rdfm
pkgver=0.1.1
pkgrel=1
pkgdesc="The Rusty DotFiles Manager"
arch=('x86_64')
url="https://github.com/Wafelack/rdfm"
license=('AGPL3')
depends=('gcc-libs' 'zlib' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('22491b5d8ad6ab7020f2c1bd5dfd63e09276ff431b38bc14c5c8fdfdb76e4039b9af65659c26acdb0baf5f299830c3df0ab699cd6f94e30135ef326f577845ab')

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
}
