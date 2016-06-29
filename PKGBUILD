# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=dreamchess-git
_pkgname=dreamchess
pkgver=312.c7fad45
pkgrel=3
pkgdesc="DreamChess - OpenGL Chess Game"
arch=('i686' 'x86_64')
url="https://github.com/dreamchess/dreamchess"
license=('GPL')

# tried to include all necessary deps and none that aren't
# please notify if list not fully correct
depends=(mxml sdl_mixer sdl_image glew hicolor-icon-theme)
makedepends=(git bison)

source=('git://github.com/dreamchess/dreamchess.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/dreamchess"
  echo "$(git rev-list --count HEAD).$(git log --pretty=format:'%h' -n 1)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  # must autoreconf or missing install-sh
  autoreconf -fvi
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
