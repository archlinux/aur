# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=bookmark
pkgver=0.1.0
pkgrel=1
pkgdesc="Save URLs from the terminal and open them quickly in the browser"
arch=('x86_64')
url="https://github.com/Szymongib/bookmark"
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('586ac74288f598c5601cb687c7078037901cc049ca8cf5fa3f9ed3fad1b59c71b3a535dfd5573f88bef321cf9811b49d841faac5d1b9922a4ac24395f45141cb')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
