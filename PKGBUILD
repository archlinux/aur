# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bao
pkgver=0.10.0
pkgrel=2
pkgdesc="A verified streaming tool"
arch=('i686' 'x86_64')
url="https://github.com/oconnor663/bao"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oconnor663/bao/archive/$pkgver.tar.gz")
sha256sums=('bd83bd9f1399fe81601d80ce8b13bc027ea135d2520f9a21f1c1a07a2647491d')


check() {
  cd "$pkgname-$pkgver"

  cargo test --release
}

package() {
  cd "$pkgname-$pkgver"

  cargo install --root "$pkgdir/usr" --path "$srcdir/$pkgname-$pkgver/bao_bin"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/bao"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/bao"

  rm -f "$pkgdir/usr"/.crates*
}
