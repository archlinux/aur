# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-make
pkgver=1.1.1
pkgrel=2
pkgdesc="Makefile grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-make"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('nodejs' 'tree-sitter-cli')
provides=('libtree-sitter-make.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-make/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31affca06041623cfa5f6a728cb3f0f2a8eb7fd01607e1a2681ea1f318367211')


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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-make"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-make"
}
