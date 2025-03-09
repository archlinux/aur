# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-kotlin
pkgver=1.1.0
pkgrel=2
pkgdesc="Kotlin grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-kotlin"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('nodejs' 'tree-sitter-cli')
provides=('libtree-sitter-kotlin.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-kotlin/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3c36bd5627fff38e4323ebead1f7e86e6d1727f0353618d1c976fea88260ba90')


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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-kotlin"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-kotlin"
}
