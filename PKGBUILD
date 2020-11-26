# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termchat
pkgver=1.1.1
pkgrel=1
pkgdesc="Terminal chat through the LAN"
arch=('x86_64')
url="https://github.com/lemunozm/termchat"
license=('Apache')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c1ba3f94a734b93c5649d9a536bc9308535b3ed174dcc080750e2906d70e78445ec74049e66fccf217ddcb06803ca6025da19b898e8ec9e3f7633fd0bb0010a7')

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
