# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=flipperbit
pkgver=0.1.3
pkgrel=1
pkgdesc='Corrupted files generator. Random bits flipper.'
url='https://crates.io/crates/flipperbit'
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('8a7bb4ed94a7ba48e084f479b3beffc293b609975d740473d74cde233d31b31a08ad61b2257593a1736f7bc7dd82da14258ffc86de104c624468274c8eaa5980')

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
    target/release/flipperbit
}
