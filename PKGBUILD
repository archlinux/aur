# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cicero
pkgver=0.1.2
pkgrel=1
pkgdesc="Unicode tool with a terminal user interface"
arch=('x86_64')
url="https://github.com/eyeplum/cicero-tui"
license=('GPL3')
makedepends=('cargo' 'cmake' 'fontconfig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b531556f0ea8a4789d54ef0d325b1d5d96000e76799b2e55a30641b4e1093f74344e37b53c876774f2ab5091f076e48ff267bd1e46c4ec80075af93ce99d1e01')

build() {
  cd "$pkgname-tui-$pkgver"
  cargo build --release
}

check() {
  cd "$pkgname-tui-$pkgver"
  cargo test --release
}

package() {
  cd "$pkgname-tui-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
