# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-latex
pkgver=0.5.0
pkgrel=1
pkgdesc="LaTeX grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/latex-lsp/tree-sitter-latex"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('nodejs' 'tree-sitter-cli')
provides=('libtree-sitter-latex.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/latex-lsp/tree-sitter-latex/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eb925f3f2f8b2543d8fb9f3d99015a6048882575acbad5780c405cd59e5ec3e2')


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
