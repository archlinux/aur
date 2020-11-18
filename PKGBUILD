# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fclones
pkgver=0.8.0
pkgrel=1
pkgdesc="Efficient Duplicate File Finder"
arch=('x86_64')
url="https://github.com/pkolaczk/fclones"
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('be9a23459bb68856cd9f1c681d578092473fde66a5a64d5cdac134b19370909037406e53daffbeb784419411ced1f7d078398e0481df4bd2dd23833b61cf44bb')

build() {
  cd "$pkgname-$pkgver"
  # TODO: Use `--locked` flag for reproducibility.
  # Tracking issue: https://github.com/pkolaczk/fclones/issues/30
  cargo build --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
