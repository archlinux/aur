# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-r
pkgver=1.1.0
pkgrel=1
pkgdesc="R grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/r-lib/tree-sitter-r"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('tree-sitter-cli')
provides=('libtree-sitter-r.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/r-lib/tree-sitter-r/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8134b66e67323f1f607b98b2ad70146fe7648f8e218953bdadfb892cf959f67e')


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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-r"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-r"
}
