# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Edu4rdSHL <edu4rdshl@securityhacklabs.net>
# https://github.com/orhun/pkgbuilds

pkgname=unimap
pkgver=0.5.0
pkgrel=1
pkgdesc="Scan only once by IP address and reduce scan times with Nmap for large amounts of data"
arch=('x86_64')
url="https://github.com/Edu4rdSHL/unimap"
license=('GPL3')
depends=('nmap')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('018e0e14858b24a787cea233e066f1142fe7ee057ca759854974435a732e5f45ba2e383d6b27223081bff27f6a38c54ffe99f14ae4d83b8e29f5580863ced6de')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
