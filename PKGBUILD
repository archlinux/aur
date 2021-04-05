# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold
pkgver=1.0.4
pkgrel=1
pkgdesc="CLI tool to help keep track of Git repositories"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
depends=('zlib' 'gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('f4f81c3fc473e6fa4c98edaf63dd92d7fd6131170e4b1836070115889c13d9d9653ceb26043b020c232dc4bc45a04eafe9144a960a97f891c5282e177b3dc22e')

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
