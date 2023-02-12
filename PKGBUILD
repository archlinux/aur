# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=tetris-rs
pkgver=0.1.4
pkgrel=1
pkgdesc='Terminal based tetris game written in rust.'
url='https://crates.io/crates/tetris-rs'
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('tetris')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('180bb3e6f6e46a976758ef9087e8fc2460248d460675ca827415ad5b1945b95fe54f4863ddefb3227cc2e772bd6baeb919172a9a55c8933ae13b308d1574ba84')

prepare() {
  cd $pkgname-$pkgver 
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  cargo build --frozen --release
}

check() {
  cd $pkgname-$pkgver
  cargo test --frozen
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 -t "${pkgdir}/usr/bin" \
    target/release/tetris
}

