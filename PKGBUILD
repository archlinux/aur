# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=html-query
_pkgname=hq
pkgver=0.2.0
pkgrel=1
pkgdesc="jq, but for HTML"
arch=('x86_64')
url="https://github.com/orf/hq"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6114fcf0adf848efbffab1b9e37a63b6bdcb3f73209331823cc099445b5c184f4ad36d7f69916c443c2a27b013da9f28701e4032bcc7829f14666f9449375a76')

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
