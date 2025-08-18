# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-php
pkgver=0.24.2
pkgrel=1
pkgdesc="PHP grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-php"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('nodejs' 'tree-sitter-cli')
provides=('libtree-sitter-php.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/tree-sitter/tree-sitter-php/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0e73ad63dda67ac12c0e012726a4e1a9811c26b020a0a2dea3e889f8246d9cf4')


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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-php"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-php"
}
