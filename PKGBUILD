# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Edu4rdSHL <edu4rdshl@securityhacklabs.net>
# https://github.com/orhun/pkgbuilds

pkgname=unimap
pkgver=0.7.0
pkgrel=1
pkgdesc="Scan only once by IP address and reduce scan times with Nmap for large amounts of data"
arch=('x86_64')
url="https://github.com/Edu4rdSHL/unimap"
license=('GPL3')
depends=('nmap')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('f5d0df5ec82ed535dc21dbc8ce4c595717fcab3feedfdc6812b9c292b328606de0f456bc02cbc9486dc71ead145d8704552b76b79e2184bb4f6efb3d5df25b9d')

prepare() {
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
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
