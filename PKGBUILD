# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=hadlock
pkgver=1.1.6
pkgrel=1
pkgdesc="X window manager"
arch=('x86_64')
url="https://github.com/AdaShoelace/hadlock"
license=('MIT')
depends=('dbus' 'libxinerama')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ed7efb50410f75398b4ecf963e19ca115ba267501d4759f5754ee561c2da59610c8818f1575ab603f1a9c1112cc921d08f0115c4e02b6488b13a3cb5598f4ac1')

build() {
  cd "$pkgname-$pkgver"
  # TODO: Use `--locked` flag for reproducibility.
  # Tracking issue: https://github.com/AdaShoelace/hadlock/issues/63
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
