# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=mdbook-linkcheck
pkgver=0.7.5
pkgrel=1
pkgdesc="A mdbook backend which will check all links in a document are valid"
arch=('x86_64')
url="https://github.com/Michael-F-Bryan/mdbook-linkcheck"
license=('MIT')
depends=('mdbook')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('2f70057f68b1944be4a7d9c98a59db97876c0a875eb254a5b17a33036f1c68d6677ad8861b86abcbb4c9c818317314b71febf607ae33f4d61d3d577298788829')

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
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
