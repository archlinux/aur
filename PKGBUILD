# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Edu4rdSHL <edu4rdshl@securityhacklabs.net>
# https://github.com/orhun/pkgbuilds

pkgname=fhc
pkgver=0.5.0
pkgrel=1
pkgdesc="Fast HTTP Checker"
arch=('x86_64')
url="https://github.com/Edu4rdSHL/fhc"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('467339cf7497c0e4bfbdaafc57393f3541a61066f55d78f8b2b80edf85cb05f371c8bff3108e3a2c7398b5572a9227737ddc128886f4ada58c32f272fc33e3fc')

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
  install -Dm 644 "$pkgname.1" -t "$pkgdir/usr/share/man/man1"
}
