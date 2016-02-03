# Maintainer: Samuel Walladge <swalladge at gmail dot com>

pkgname=dreamchess-git
pkgver=312.c7fad45
pkgrel=1
pkgdesc="DreamChess - OpenGL Chess Game"
arch=('any')
url="https://github.com/dreamchess/dreamchess"
license=('GNU')
depends=(bison mxml)
makedepends=('git')
source=('git://github.com/dreamchess/dreamchess.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/dreamchess"
  echo "$(git rev-list --count HEAD).$(git log --pretty=format:'%h' -n 1)"
}

build() {
  cd "$srcdir/dreamchess"
  # must autoreconf or missing install-sh
  autoreconf -fvi
  ./configure
  make
}

package() {
  cd "$srcdir/dreamchess"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
