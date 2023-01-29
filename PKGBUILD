# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=zip-password-finder
pkgver=0.6.3
pkgrel=1
pkgdesc="Find the password of protected ZIP files"
arch=('x86_64')
url="https://github.com/agourlay/zip-password-finder"
license=('Apache')
depends=('bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('dc5b7f65f4948b6608d894206c388b97f96a9f3fd640d46296e96de87e961edebecf6d673484c65ebf5ab9f33649a55fe6738c4c6142fed4aec8e165324d9c13')
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
