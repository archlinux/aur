# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=tree-sitter-git
pkgver=0.20.9.r9.g78c297e6
pkgrel=1
pkgdesc="An incremental parsing system for programming tools"
arch=('i686' 'x86_64')
url="https://tree-sitter.github.io/tree-sitter/"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("tree-sitter=$pkgver" 'libtree-sitter.so')
conflicts=('tree-sitter')
options=('staticlibs')
source=("git+https://github.com/tree-sitter/tree-sitter.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter"

  make
}

package() {
  cd "tree-sitter"

  make \
    DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter"
}
