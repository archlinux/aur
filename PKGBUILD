# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-yaml
pkgver=0.7.1
pkgrel=1
pkgdesc="YAML grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-yaml"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('nodejs' 'tree-sitter-cli')
provides=('libtree-sitter-yaml.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-yaml/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0626a1d89d713a46acd0581b745d3dcfe0b3714279eb6cf858fe78ff850a5a2b')


build() {
  cd "$pkgname-$pkgver"

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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-yaml"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-yaml"
}
