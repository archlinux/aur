# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Timo Schmiade <the_isz@gmx.de>

pkgname=gitstats-git
_pkg="${pkgname%-git}"
pkgver=r294.55c5c28
pkgrel=2
pkgdesc="Statistics generator for git repositories."
arch=("any")
url="https://github.com/hoxu/gitstats"
license=('GPL' 'GPL3')
depends=('git' 'python' 'gnuplot')
makedepends=('git')
source=("$_pkg::git+$url")
md5sums=("SKIP")

pkgver() {
  cd "$_pkg"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkg"
  sed -i 's/python2/python3/' gitstats
}

build() {
  cd "$_pkg"
  2to3 -Wn "$_pkg"
}

package() {
  cd gitstats
  make install PREFIX="$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
