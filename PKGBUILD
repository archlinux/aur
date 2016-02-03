# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=dreamchess-git
pkgver=312.c7fad45
pkgrel=2
pkgdesc="DreamChess - OpenGL Chess Game"
arch=('any')
url="https://github.com/dreamchess/dreamchess"
license=('GPL')

# tried to include all necessary deps and none that aren't
# please notify if list not fully correct
depends=(mxml sdl_mixer sdl_image glew libgl expat)
makedepends=(git bison)

source=('git://github.com/dreamchess/dreamchess.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/dreamchess"
  echo "$(git rev-list --count HEAD).$(git log --pretty=format:'%h' -n 1)"
}

build() {
  cd "${srcdir}/dreamchess"
  # must autoreconf or missing install-sh
  autoreconf -fvi
  ./configure
  make
}

package() {
  cd "${srcdir}/dreamchess"
  make DESTDIR="${pkgdir}" install

  # removing man pages otherwise pacman complains of filesystem conflict.
  # not sure where the bug is, someone can check it out later
  rm -r ${pkgdir}/usr/local/share/man
}

# vim:set ts=2 sw=2 et:
