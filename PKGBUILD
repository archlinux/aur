# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-regex
pkgver=0.24.3
pkgrel=1
pkgdesc="Regex grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-regex"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('tree-sitter-cli')
provides=('libtree-sitter-regex.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/tree-sitter/tree-sitter-regex/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('92f24bb779a92debe259cc1c204aab78f425f0fc1e8b4f2c03b6896d2da8f0a3')


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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-regex"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-regex"
}
