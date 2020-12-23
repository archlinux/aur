# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cicero
pkgver=0.1.4
pkgrel=1
pkgdesc="Unicode tool with a terminal user interface"
arch=('x86_64')
url="https://github.com/eyeplum/cicero-tui"
license=('GPL3')
depends=('fontconfig' 'freetype2')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('85802f1d68a57fc9114d13a720afcc9573acae41abf0d53102e8ed8abfefb4800e290d83995308c120724e9cdb6edd550b7a7ce926789ca74ce544f7037256d4')

build() {
  cd "$pkgname-tui-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-tui-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-tui-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
