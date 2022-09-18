# Maintainer: Dario Vladovic <d.vladimyr@gmail.com>
pkgname=asuka
pkgver=0.8.3
pkgrel=1
pkgdesc='Gemini Project client written in Rust with NCurses'
arch=('x86_64')
url=https://sr.ht/~julienxx/Asuka
license=('MIT')
depends=('openssl' 'ncurses')
makedepends=('rust' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~julienxx/asuka/archive/$pkgver.tar.gz")
sha512sums=('0b26d5fbc38e8bf16cf2eaad68a62a710870ce17bf1a4b577c96c0f99427c13e80fd67d7bec3672ce83dc1ed3df4dc44baa517a1ef21534c64e30613338f3eb0')

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

