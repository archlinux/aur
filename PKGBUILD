# Maintainer: Dario Vladovic <d.vladimyr@gmail.com>
pkgname=asuka
pkgver=0.8.5
pkgrel=1
pkgdesc='Gemini Project client written in Rust with NCurses'
arch=('x86_64')
url=https://sr.ht/~julienxx/Asuka
license=('MIT')
depends=('openssl' 'ncurses')
makedepends=('rust' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~julienxx/asuka/archive/$pkgver.tar.gz")
sha512sums=('324a0d0e24e0a3447918367482f4dbae8dbb6af8846d244b887c36b96c4fb60473dcd9059fde20e8ed863d9f4e298b3c7280325126b6ebc88e75e242aad34b35')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --frozen
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/asuka "$pkgdir/usr/bin/asuka"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

