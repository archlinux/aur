# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cicero
pkgver=0.4.0
pkgrel=1
pkgdesc="Unicode tool with a terminal user interface"
arch=('x86_64')
url="https://github.com/eyeplum/cicero-tui"
license=('GPL3')
depends=('fontconfig' 'freetype2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2ee127448af6058fec20e27fedb14aee700948d87e282d567df4c561c15719be12203fa460aeb0ee108182a4b485816910c6448467afded198e5aa16f323fb4b')

prepare() {
  cd "$pkgname-tui-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-tui-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-tui-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-tui-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
