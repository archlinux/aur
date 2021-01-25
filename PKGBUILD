# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=t-rec
pkgver=0.5.0
pkgrel=1
pkgdesc="Blazingly fast terminal recorder"
arch=('x86_64')
url="https://github.com/sassman/t-rec-rs"
license=('GPL3')
depends=('libx11' 'imagemagick')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ee580868149d9451737d9e06e877fc3c81af07e0225b1478ce7b37c9374622a05ac82f069adee07f69f4a901af2bb942ea70a60e98b9efc842e2327f02932fd5')

build() {
  cd "$pkgname-rs-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-rs-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-rs-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
