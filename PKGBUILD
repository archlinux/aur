# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=uwuifyy
pkgver=0.3.0
pkgrel=1
pkgdesc="A command line tool to uwu'ify your text"
arch=('x86_64')
url="https://github.com/sgoudham/uwuifyy"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('95d080ed08cc741acf8c0b0f7f6e4c1c43a2e656271ef848af1f7bdf01009621e0b2ebf2bda2a9c70284dd3bb522c7dbd461d3f65055cf554e6e7cb0221021c9')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu" # --locked
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
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
