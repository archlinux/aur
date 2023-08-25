# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Edu4rdSHL <edu4rdshl@securityhacklabs.net>
# https://github.com/orhun/pkgbuilds

pkgname=unimap
pkgver=0.6.0
pkgrel=1
pkgdesc="Scan only once by IP address and reduce scan times with Nmap for large amounts of data"
arch=('x86_64')
url="https://github.com/Edu4rdSHL/unimap"
license=('GPL3')
depends=('nmap')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('91b5c18a83075226f93cfdbffd8c925d37932f6814b4b40653aabf5d0153d94d46555704276cb682b41f5baaf7c6167a9a91a138c3053cdf29d22cf22c495c83')

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
