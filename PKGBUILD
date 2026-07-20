# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=latuicon
pkgver=0.1.2
pkgrel=1
pkgdesc="A terminal UI icon picker for emoji, kaomoji, Unicode characters, and Nerd Font glyphs"
arch=('x86_64')
url="https://github.com/coko7/latuicon"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c285382dddbf91bbe91f23b118737e42889cd5e773a8980096da562646960808')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" --locked
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
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE THIRD_PARTY_LICENSES.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
