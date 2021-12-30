# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=t-rec
pkgver=0.6.2
pkgrel=1
pkgdesc="Blazingly fast terminal recorder"
arch=('x86_64')
url="https://github.com/sassman/t-rec-rs"
license=('GPL3')
depends=('imagemagick')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('74e839a7a779f1b76178912af14b9007ad56d8687f24b6067c13c55b744326633dacf2ad2080bf3c1935384dd93efbc388858650b3d337fc49f89e6c8af0bfdd')

prepare() {
  cd "$pkgname-rs-$pkgver"
  cargo fetch --locked
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
