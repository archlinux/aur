# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=otree
pkgver=0.4.0
_commit=c519c1d59700fb8d35d5b694327cdb5328c8a002
pkgrel=1
pkgdesc="Object Tree TUI Viewer"
arch=('x86_64')
url="https://github.com/fioncat/otree"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver::git+$url#commit=$_commit")
sha512sums=('583aa6fd9421b61c68e566ac969925fa5bbf973ae8890d68268b8c33bced0c6ba4690357faa269f8058469f2a0fda3cddc449c0b6dbb74878a1967c7370d57ad')

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
