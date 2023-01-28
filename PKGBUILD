# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=zip-password-finder
pkgver=0.6.2
pkgrel=1
pkgdesc="Find the password of protected ZIP files"
arch=('x86_64')
url="https://github.com/agourlay/zip-password-finder"
license=('Apache')
depends=('bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2a5a06d5f4be55ccf8163f106de143f98fc24834c667c9c18e772422ac86cdce062734c30c5fa0a5b39bef436d51f1470b86bc5969ddeb7acfd3bbd269d5a5be')
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
