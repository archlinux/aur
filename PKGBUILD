# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-commonlisp
pkgver=0.4.0
pkgrel=1
pkgdesc="Common Lisp grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-commonlisp"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('nodejs' 'tree-sitter-cli')
provides=('libtree-sitter-commonlisp.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-commonlisp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('671cf48c21f2d7c663cf53cc0e9037307a0178d094c6c62df6b5e6cb45f61437')


build() {
  cd "$pkgname-$pkgver"

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
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/tree-sitter-commonlisp"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-commonlisp"
}
