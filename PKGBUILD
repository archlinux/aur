# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=passepartui
pkgver=0.1.5
pkgrel=1
pkgdesc="A TUI for pass"
arch=('x86_64')
url="https://github.com/kardwen/passepartui"
license=('MIT')
depends=('gcc-libs' 'pass')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6552f363b445d7f1ed71ed77bea40afc2c67c06c26fe72739baed7a6103cb58bf24dd1d0fa8afba34e46931f171eadba935f52c1e91c4c1e142bf69962d9b05f')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu" # --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
