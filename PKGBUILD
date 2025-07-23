# Maintainer: Grzegorz Kwacz <gkwacz at hotmail dot com>

pkgname=tree-sitter-cmake
pkgver=0.7.1
pkgrel=1
pkgdesc="CMake grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/uyha/tree-sitter-cmake"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('tree-sitter' 'tree-sitter-cli' 'npm')
provides=("lib$pkgname")
source=("$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6ef4df3b92b1b62d52674ffd5b70cf35b38bb77657da5f975f0b282228045b61')

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
  pwd
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
