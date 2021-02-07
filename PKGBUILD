# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termchat
pkgver=1.2.0
pkgrel=2
pkgdesc="Terminal chat through the LAN"
arch=('x86_64')
url="https://github.com/lemunozm/termchat"
license=('Apache')
depends=('gcc-libs')
makedepends=('rust' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('41e14ce0ca6eaa9170f160455b4afff7c60e546e64c6e89e84083cc86a5a35af1cf66b5e71548328591cb6de8da95c3fec1cad819f28824093ff73125e3766cc')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
