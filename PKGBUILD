# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold
pkgver=1.0.3
pkgrel=1
pkgdesc="CLI tool to help keep track of Git repositories"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
depends=('zlib' 'gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('09daa7dc2cf415b7a4cc365a2c1c87c6ffbe8b73d54aa2bad595537d78982f5c07b5640e4e7166d8d1459251d5bf7e4ebe1177792f21d6cf388c08073dc4aad7')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --package "$pkgname"
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --package "$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
