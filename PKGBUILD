# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=zip-password-finder
pkgver=0.11.1
pkgrel=1
pkgdesc="Find the password of protected ZIP files"
arch=('x86_64')
url="https://github.com/agourlay/zip-password-finder"
license=('Apache-2.0')
depends=('bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b0a580ab0368817eb1117b159869606c6fc557c71b22af06b156cc4647d44ab5ffc431ba3109adc62c45d7d3e6465053be22aedfc163429fd141e64d5d115322')
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
