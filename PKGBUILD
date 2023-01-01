# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=i3-workspace-brightness
pkgver=1.0.3
pkgrel=1
pkgdesc="Utility to auto-adjust the brightness of i3wm workspaces"
arch=('x86_64')
url="https://github.com/orhun/i3-workspace-brightness"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('48acbd462b38eee6123fcf333be81eb4585c62f1f291d25039c1d00ed219dd3b4cd946fc043387f12f6fbba29ba9f246ea8076e16288aa0ce09e49e854b79955')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
