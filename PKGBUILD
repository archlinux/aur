# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-swift
pkgver=0.7.1
pkgrel=1
pkgdesc="Swift grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/alex-pinkus/tree-sitter-swift"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('nodejs' 'tree-sitter-cli')
provides=('libtree-sitter-swift.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/alex-pinkus/tree-sitter-swift/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e3bcd98c07243e45ee1e85c3c03359cd38a85645544d8a3d5678076ec5f8c772')


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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-swift"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-swift"
}
