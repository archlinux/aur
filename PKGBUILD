# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=conserve
pkgver=23.5.0
pkgrel=1
pkgdesc="Robust portable backup tool written in Rust"
arch=('x86_64')
url="https://github.com/sourcefrog/conserve"
license=('GPL2')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('839786ec7d67d45f164e7be3284354195e0daac5dc8d9aedca28f6bbdc125110e90bf9eb8b7a2d7fa2672fd99c68c277d7e2120f1c6766bdfaed93d35e85795c')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
}
