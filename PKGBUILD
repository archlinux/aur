# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=rusty-hook
pkgver=0.11.2
pkgrel=1
pkgdesc="Git hook manager"
arch=('x86_64')
url="https://github.com/swellaby/rusty-hook"
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('f531ce50a7eee3e7a6fe2bc1700438e1dfd52aa16b2deb6099666435178d44bc8f2281bcd8eb59a90ac9da551ae4e6cdda61759dbd1b8f8339ccdc2e33b0d783')

prepare() {
  # download dependencies
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

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
