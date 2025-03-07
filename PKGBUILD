# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-latex
pkgver=0.4.0
pkgrel=2
pkgdesc="LaTeX grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/latex-lsp/tree-sitter-latex"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('tree-sitter-cli')
provides=('libtree-sitter-latex.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/latex-lsp/tree-sitter-latex/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('12223f7cde2fd96c1977ed5266ac932c10c13154f2930363c6e85d7bcd2d3f12')


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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-latex"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-latex"
}
