# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=otree
pkgver=0.6.3
_commit=0e97a64dc3b977219a73926ce0b6d30fcb741e43
pkgrel=1
pkgdesc="Object Tree TUI Viewer"
arch=('x86_64')
url="https://github.com/fioncat/otree"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver::git+$url#commit=$_commit")
sha512sums=('6de5431cbc7f63ef617b1960d0c64be6748e4eae5c646326366bd26c50bb56c2e2aee9fd947176aedfd4b7262f40d9f4831f006ed56e4373562b760ca1246cee')

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
