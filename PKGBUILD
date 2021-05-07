# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=t-rec
pkgver=0.6.0
pkgrel=1
pkgdesc="Blazingly fast terminal recorder"
arch=('x86_64')
url="https://github.com/sassman/t-rec-rs"
license=('GPL3')
depends=('libx11' 'imagemagick')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d952125e1690aaf6812b8bb633aa8cf0a7e4fb261f23e7c00da77a9e82ff9340cc42e8fe3ebbdc0917e0feb49238078b4bb5cac7e2c4ff2a24a4e46fbb8f613c')

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
