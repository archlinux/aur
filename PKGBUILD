# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cicero
pkgver=0.2.0
pkgrel=1
pkgdesc="Unicode tool with a terminal user interface"
arch=('x86_64')
url="https://github.com/eyeplum/cicero-tui"
license=('GPL3')
depends=('fontconfig' 'freetype2')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('38184e5b51e08fe99f3c96c5a9e761492f91a3acf953ab2c13fcc1e959a9070bc2b4fe699d1e62981d5d29ab785b00e219d011495f6a35cc6215c5bb03845688')

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
