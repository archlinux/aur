# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=proby
pkgver=1.0.0
pkgrel=1
pkgdesc="Check whether hosts are reachable on certain ports and return result on HTTP"
arch=('x86_64')
url="https://github.com/svenstaro/proby"
license=('MIT')
makedepends=('rust')
source=($pkgname-$pkgver.tar.gz::https://github.com/svenstaro/proby/archive/v${pkgver}.tar.gz)
sha512sums=('e095430da0121d847104ca0e2c53beb42ad050c7e8b6b56361fead8a6ee86e836b541bb44ddd253c480ed4fbaf8248cce1dffb75ff48a9ee3d5eb3ecf82abb8d')

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
