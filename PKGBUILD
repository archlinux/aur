# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=otree
pkgver=0.4.1
_commit=3bf009ade932386f2639e611c2f4a6fd4213ee0a
pkgrel=1
pkgdesc="Object Tree TUI Viewer"
arch=('x86_64')
url="https://github.com/fioncat/otree"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver::git+$url#commit=$_commit")
sha512sums=('4dd89fdf0eb00d0b1b01462249591924165a0e84881df7a47336c86b42348ac18798f53d521990948e04609e904471636d8ecc08b2f23361f505199d70c5d752')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
