# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=miniserve
pkgver=0.7.0
pkgrel=1
pkgdesc="Tool to serve files via HTTP"
arch=('x86_64')
url="https://github.com/svenstaro/miniserve"
license=(MIT)
makedepends=(cargo)
source=(miniserve-$pkgver.tar.gz::https://github.com/svenstaro/miniserve/archive/v${pkgver}.tar.gz)
sha512sums=('01909a0952956216cf2b625b7d92f60a907ae205a17da95ebd769a642c25a57fcbd5783ea42dc9ab1b4384ea8aa506dbc3e5d695f7f918e2bc103a478fc9a13c')

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

  install -Dm755 target/release/miniserve "$pkgdir"/usr/bin/miniserve
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
