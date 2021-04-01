# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold
pkgver=1.0.2
pkgrel=1
pkgdesc="CLI tool to help keep track of Git repositories"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
depends=('zlib' 'gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('89647594f192115088edad6e00f42293f527d28848d32a07b8259822ffd8b4313778c984f4dd891d15af9c38e7c7b2433a221b849401c3ee05d0611bb17d533f')

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
