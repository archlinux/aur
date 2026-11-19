# Maintainer: Coobyk <mail@coobyk.com>
pkgname=oblyx
pkgver=0.1.0.r73
pkgrel=1
pkgdesc="Convert GoodNotes notebooks to SVG, PDF, PNG, and Notability .ntb (CLI)"
arch=('x86_64')
url="https://github.com/Coobyk/oblyx"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('poppler: rasterize PDF page backgrounds for SVG/PNG output'
            'oblyx-gui: graphical interface')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Coobyk/oblyx/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(''2d9b98f60ab3c010bd3558a2ae68c4ebc9e1082b5f9c27ebe3dd6dde918fa153'')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --bin oblyx
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/oblyx" "$pkgdir/usr/bin/oblyx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
