# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-php
pkgver=0.23.12
pkgrel=1
pkgdesc="PHP grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-php"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('tree-sitter-cli')
provides=('libtree-sitter-php.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/tree-sitter/tree-sitter-php/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5c94b16bf1c6c4ed5bd9cc1ba27f0d2e69871f978ad7160c0e64291e2fa0169e')


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
