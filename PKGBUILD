# Maintainer: Dario Vladovic <d.vladimyr@gmail.com>
pkgname=asuka
pkgver=0.8.3
pkgrel=1
pkgdesc='Gemini Project client written in Rust with NCurses'
arch=('x86_64')
url=https://sr.ht/~julienxx/Asuka
license=('MIT')
depends=('gcc-libs' 'zlib' 'openssl' 'ncurses')
makedepends=('rust' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~julienxx/asuka/archive/$pkgver.tar.gz")
sha256sums=('1305d65e07e83fe33ca102637fa27f8dafae9a9aaa436414c29532c4ed51c6ea')

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

