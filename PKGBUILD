# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-jsdoc
pkgver=0.25.0
pkgrel=1
pkgdesc="JSDoc grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-jsdoc"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('nodejs' 'tree-sitter-cli')
provides=('libtree-sitter-jsdoc.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/tree-sitter/tree-sitter-jsdoc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ca870c983c51bfb6b25c4cf316e28c685d0f6e9847e359c7da8d16eedd60d623')


build() {
  cd "$pkgname-$pkgver"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "$pkgname-$pkgver"

  #tree-sitter test
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-jsdoc"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-jsdoc"
}
