# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cicero
pkgver=0.1.3
pkgrel=1
pkgdesc="Unicode tool with a terminal user interface"
arch=('x86_64')
url="https://github.com/eyeplum/cicero-tui"
license=('GPL3')
makedepends=('rust' 'cmake' 'fontconfig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2d4d060b12705b7d4f1b9e5f86754b73e46d21f37321f8b4707af8c56c52ad8450809158263b7ed39fecf3cc291efd7e572eaa91480c5f1a22871e1e6137508e')

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
