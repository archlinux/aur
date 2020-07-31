# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=notp
pkgver=2.1.0
pkgrel=1
pkgdesc="One Time Password Generator"
arch=('x86_64')
url="https://github.com/kondanta/notp/"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('606a862708b0dbb68fdb48ad26ee48f4263e39507195702ffb3f1d2e71a57b4371a66b3aaddc8a7bc93fa9be27eb3c1d716e1229ca90e91f889a639764c69535')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
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