# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=doctave
pkgver=0.4.0
pkgrel=1
pkgdesc="A batteries-included developer documentation site generator"
arch=('x86_64')
url="https://www.doctave.com"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Doctave/doctave/archive/$pkgver.tar.gz")
sha512sums=('061535f623dd7780589b7837dfc8d6bbdae8fb961baa4a6a0a1a4f1a7cf6be85c089852d8bf04433b485567d7e90ee9045dccb35dffcb729df5dda0d05295532')
b2sums=('2d9d2fdb738f768e2b25b27c94b4510a0c86bf0bcd3b5d08f6fa9b90af6889e9f91efd7e27a844ccc25603ea74d59495d5d5681cc9f5c86461a6de80cbcba5ea')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/doctave

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
