# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=t-rec
pkgver=0.8.1
pkgrel=1
pkgdesc="Blazingly fast terminal recorder"
arch=('x86_64')
url="https://github.com/sassman/t-rec-rs"
license=('GPL3')
depends=('imagemagick')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('327d10565eac28dbda6e98aafa4137fc2fb00684f29623bab74e54122a42d20c6318085bc472bdd5dd6464d14b075094cf3ac68baa5a7056a63c5874ad9c73b1')

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
