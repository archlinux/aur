# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=t-rec
pkgver=0.7.3
pkgrel=1
pkgdesc="Blazingly fast terminal recorder"
arch=('x86_64')
url="https://github.com/sassman/t-rec-rs"
license=('GPL3')
depends=('imagemagick')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('20319489a0eb07294ea6333bdd1a263cab8ccfd3e0cab648eccf893da28742b1cec97f27f978af34a6ba72b5b3149f470d46d2866f3354dc120e9cba5ac23de9')

prepare() {
  cd "$pkgname-rs-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-rs-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-rs-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-rs-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
