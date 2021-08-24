# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=aq
pkgver=0.2.0
pkgrel=1
pkgdesc="Like jq, but for JSON, TOML & YAML"
arch=('x86_64')
url="https://github.com/rossmacarthur/aq"
license=('Apache' 'MIT')
depends=('jq')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('1a9b725fe9898a63c2f76bf416e2ed2e98974e402d70dff82d91453479c8dddcbf7697ef5bbdd614d7308b579e1cf1028b6dbb6ed5449fc4b76d05da9e073016')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/aq

  # licenses
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
