# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cicero
pkgver=0.2.2
pkgrel=1
pkgdesc="Unicode tool with a terminal user interface"
arch=('x86_64')
url="https://github.com/eyeplum/cicero-tui"
license=('GPL3')
depends=('fontconfig' 'freetype2')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('353875e82d311ed518bf0452acd8128ebdbb9a85678dcc8a3bf032f2dc863c5c88b0ed28f3815e10839ced70bc604d26d2190330fbd41974db3b14c9537cb9d2')

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
