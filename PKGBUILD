# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=himalaya
pkgver=0.2.4
pkgrel=1
pkgdesc="Minimalist CLI email client, written in Rust"
arch=('x86_64')
url="https://github.com/soywod/himalaya"
license=('BSD')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('db8036b29fd7b0f99981048635a12c1173084f252d8d263c8d1ba67afbe8cdb6e9560a50f2d6c1f7253eb1977e0e0e6c9b80164a30b1f76c99153bf83d5e7544')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release #--locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release #--locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
