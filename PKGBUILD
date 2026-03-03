# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=otree
pkgver=0.6.5
_commit=8744b14beed80b053899f966d6c8475e0bfe13ef
pkgrel=1
pkgdesc="Object Tree TUI Viewer"
arch=('x86_64')
url="https://github.com/fioncat/otree"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver::git+$url#commit=$_commit")
sha512sums=('5746bd0979d0e84e2506877d497d8c8c9284a6924c983f346e769dd3d22c7bd0b4d59f8b9307cb4a6ac21d01ef70bbafda486fde08d79cac4031a2e8526c63e1')

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
