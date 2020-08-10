# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=proby
pkgver=1.0.2
pkgrel=1
pkgdesc="Check whether hosts are reachable on certain ports and return result on HTTP"
arch=('x86_64')
url="https://github.com/svenstaro/proby"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=($pkgname-$pkgver.tar.gz::https://github.com/svenstaro/proby/archive/v${pkgver}.tar.gz)
sha512sums=('5f45cc047166ca8c7ed88b456d8807a38febbd3bdbd4877e44bbdb696c75eab996f6c2f146f5073fc02ab6b2be873e65b9160b31f4a74cccebf0402f865531ba')

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

  install -Dm755 target/release/proby "$pkgdir"/usr/bin/proby
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
