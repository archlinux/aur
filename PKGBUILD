# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-commonlisp
pkgver=0.4.1
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
sha256sums=('f9767782bf94e82b847094f632f2db95b342e0ab54b1b8c8234cc1d6ac6c69a5')


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
