# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-latex
pkgver=0.6.0
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
sha256sums=('90d2085c9a46f5da0918ead2fa9b764defd57c34d493f06160f796014d2fd16a')


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
