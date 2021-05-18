# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Edu4rdSHL <edu4rdshl@securityhacklabs.net>
# https://github.com/orhun/pkgbuilds

pkgname=unimap
pkgver=0.5.1
pkgrel=1
pkgdesc="Scan only once by IP address and reduce scan times with Nmap for large amounts of data"
arch=('x86_64')
url="https://github.com/Edu4rdSHL/unimap"
license=('GPL3')
depends=('nmap')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('da28c4bb23f078a7df33d6451b6a20c6544834efd38d6ffac78bf0247cad0bde862aa21619fa3f78c8350afce4057e0c7acdc00760cde9857ff2e60e07b7964b')

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
