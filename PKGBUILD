# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=bingrep-rs
_pkgname=bingrep
pkgver=0.10.0
pkgrel=1
pkgdesc="Cross-platform binary parser and colorizer"
arch=('x86_64')
url="https://github.com/m4b/bingrep"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/m4b/bingrep/archive/v$pkgver.tar.gz)
sha512sums=('1b9aeabffe3c4619495b446ec9c9d5505126294502f2f62f09aeccd9fea91ef64478aa331373f0b1a65d56bf369ff2ea73a01bb0dc272cdc9c3fa244301e6ca1')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 target/release/bingrep "$pkgdir"/usr/bin/bingrep
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
