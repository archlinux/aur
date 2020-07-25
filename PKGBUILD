# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=oha
pkgver=0.4.0
pkgrel=1
pkgdesc="Ohayou(おはよう), HTTP load generator, inspired by rakyll/hey with tui animation"
arch=('x86_64')
url="https://github.com/hatoo/oha"
license=(MIT)
depends=(openssl)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::https://github.com/hatoo/oha/archive/v${pkgver}.tar.gz)
sha512sums=('1da0cd1347ac2063ea768373b24247f48625f5dbca59c6918cadba703cc74a52405dfe61771b23d35de6b061d6c66cdcac3c1ae8c384f4a223d1f55f9785699a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/oha "$pkgdir"/usr/bin/oha
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
