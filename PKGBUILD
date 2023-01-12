# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=zip-password-finder
pkgver=0.5.1
pkgrel=1
pkgdesc="Find the password of protected ZIP files"
arch=('x86_64')
url="https://github.com/agourlay/zip-password-finder"
license=('Apache')
depends=('bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7d67fff5c46e19d004336d1269cf4e58963eede1af25de14b07aa97f864e11eeec496a762e1597f2278be26dea622e65d47291073167f8d553c87d1aa8fe17f9')
options=('!lto')

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
