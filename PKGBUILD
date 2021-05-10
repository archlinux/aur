# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Edu4rdSHL <edu4rdshl@securityhacklabs.net>
# https://github.com/orhun/pkgbuilds

pkgname=unimap
pkgver=0.3.0
pkgrel=1
pkgdesc="Scan only once by IP address and reduce scan times with Nmap for large amounts of data"
arch=('x86_64')
url="https://github.com/Edu4rdSHL/unimap"
license=('GPL3')
depends=('nmap')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('412cba0954172d02e062bb516bd31fbcd6ce62fcc1d1f721267d7c1d2a3f1c03e38d7d530070781b91b68c8b70965c6999ab157ac84a39fb37da6a3af80952fa')

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
