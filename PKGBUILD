# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-scala
pkgver=0.23.4
pkgrel=1
pkgdesc="Scala grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-scala"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('tree-sitter-cli')
provides=('libtree-sitter-scala.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/tree-sitter/tree-sitter-scala/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d9a0b041fae70cf170147006640eb4fe98ff42242d0fe7a275d101d11bd664ef')


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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-scala"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-scala"
}
