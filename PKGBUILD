# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=proby
pkgver=1.0.1
pkgrel=1
pkgdesc="Check whether hosts are reachable on certain ports and return result on HTTP"
arch=('x86_64')
url="https://github.com/svenstaro/proby"
license=('MIT')
makedepends=('rust')
source=($pkgname-$pkgver.tar.gz::https://github.com/svenstaro/proby/archive/v${pkgver}.tar.gz)
sha512sums=('cffe63b4cb8f215cd7c539c006f9298a3e332598f61680d0c07c2c0baca37a3bb019ff9ebc22d1c878779ab73291e4d502e29f0beb39a2d72aa1498138ce1cae')

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
