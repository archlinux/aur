# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=miniserve
pkgver=0.10.3
pkgrel=1
pkgdesc="Tool to serve files via HTTP"
arch=('x86_64')
url="https://github.com/svenstaro/miniserve"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=(miniserve-$pkgver.tar.gz::https://github.com/svenstaro/miniserve/archive/v${pkgver}.tar.gz)
sha512sums=('0a17b828ff6616e9bf90af9d544bbf1083e5aa074d653c423fec25781fecbca1abc7927c1fd21337cf9462611b2a57fe25fd2c9252c70b1d9d7dcec58e2532e0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo test --release --locked -- --test-threads=1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/miniserve "$pkgdir"/usr/bin/miniserve
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
