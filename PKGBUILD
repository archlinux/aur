pkgname=tree-sitter-ada-git
pkgver=20250512
pkgrel=1
pkgdesc="Ada grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/briot/tree-sitter-ada"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
options=('staticlibs')
source=("git+$url.git")
sha256sums=('SKIP')

# TODO: pkgver()

build() {
  cd tree-sitter-ada

  tree-sitter generate
  cd src
  gcc -O2 -fPIC -shared -o libtree-sitter-ada.so parser.c
}

package() {
  cd tree-sitter-ada

  install -d "$pkgdir/usr/lib"
  cp src/libtree-sitter-ada.so "$pkgdir/usr/lib"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/tree-sitter-ada"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-ada"
}

