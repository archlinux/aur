# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cicero
pkgver=0.2.1
pkgrel=1
pkgdesc="Unicode tool with a terminal user interface"
arch=('x86_64')
url="https://github.com/eyeplum/cicero-tui"
license=('GPL3')
depends=('fontconfig' 'freetype2')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('222239978a61c51e1724f5ffe75379a4313a29a1e0de5a34aaa14ce0080daee7dab7568fcce8e6af7b87fa651bfdd0841d2403c6a7c65804e209c9d69652de50')

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
