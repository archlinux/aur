# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-commonlisp
pkgver=0.3.3
pkgrel=2
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
sha256sums=('52476161eef25b24f5b73a6c8df219105fe9fe7c7f6b666e629adf73f034ce25')


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
