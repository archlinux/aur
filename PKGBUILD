# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=t-rec
pkgver=0.6.1
pkgrel=1
pkgdesc="Blazingly fast terminal recorder"
arch=('x86_64')
url="https://github.com/sassman/t-rec-rs"
license=('GPL3')
depends=('imagemagick')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ce6e5cb3fad77d529aa600e0e36459ef4b513a70083fcc29f12a065af5ca4d9ec67e3d097a3180306c8e59f9f68741ba15b5f86e9777a8ad14a97dbe4e60f89f')

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
