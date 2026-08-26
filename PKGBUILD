# Maintainer: Grzegorz Kwacz <gkwacz at hotmail dot com>

pkgname=tree-sitter-cmake
pkgver=0.7.4
pkgrel=1
pkgdesc="CMake grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/uyha/tree-sitter-cmake"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
provides=("lib$pkgname")
source=("$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a80334791ca0d74af0a1e9698b48ee9e6163bd46053a58fdec2f1f0d4350658a')

prepare() {
  cd "$pkgname-$pkgver" || exit 1
  tree-sitter generate
}

build() {
  cd "$pkgname-$pkgver" || exit 1
  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver" || exit 1
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
