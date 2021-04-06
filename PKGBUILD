# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=xplr
pkgver=0.3.2
pkgrel=1
pkgdesc="A hackable, minimal, fast TUI file explorer"
arch=('x86_64')
url="https://github.com/sayanarijit/xplr"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c2d19c304a2c56283f44e0737ba7570850a01b8f4c398e01a70f41afbf31d4ac07eb8ba3272a61479c88fe3ad98284337bbb49a0cb4929e9db70932a630352db')

build() {
  cd "$pkgname-$pkgver"
  cargo build --locked --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --locked --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
