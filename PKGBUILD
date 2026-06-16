# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: asukaminato <asukaminato at nyan dot eu dot org>
pkgname=speedtest-rs
pkgver=0.2.0
pkgrel=1
pkgdesc='Speedtest.net testing utility and crate'
arch=('x86_64')
url=https://github.com/nelsonjchen/speedtest-rs
license=('Apache' 'MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('bed304f99d9192e71c1f495cdcb1bf81b3ebe61e46a3512ac2adee6587bd82884691e644a5d7cf6837263e339faac1fa1f5c6e29f640edef8e3fd134726d5438')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/$pkgname -t "$pkgdir"/usr/bin
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
