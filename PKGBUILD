# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-xml-git
pkgver=0.7.0.r3.g2128a0b
pkgrel=2
pkgdesc="XML & DTD grammars for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-xml"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-xml=$pkgver" 'libtree-sitter-xml.so')
conflicts=('tree-sitter-xml')
options=('staticlibs')
source=("git+https://github.com/tree-sitter-grammars/tree-sitter-xml.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-xml"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-xml"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-xml"

  #tree-sitter test
}

package() {
  cd "tree-sitter-xml"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-xml"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-xml"
}
