# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=zip-password-finder
pkgver=0.9.3
pkgrel=1
pkgdesc="Find the password of protected ZIP files"
arch=('x86_64')
url="https://github.com/agourlay/zip-password-finder"
license=('Apache-2.0')
depends=('bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e20ab7f995c9dce9d272f9a53f1d63f41a786d9d4d4870d03e84d6fcecde73d03427362fdd4af649aefdef7fd2cf76abd218a301cab3e90995cee6e831430102')
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
