# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=dreamchess-git
_pkgname=dreamchess
pkgver=569.afbefa7
pkgrel=1
pkgdesc="DreamChess - OpenGL Chess Game"
arch=('i686' 'x86_64')
url="https://github.com/dreamchess/dreamchess"
license=('GPL')

depends=(pugixml sdl2_mixer sdl2_image glew hicolor-icon-theme)
makedepends=(flex bison git cmake)

source=('git://github.com/dreamchess/dreamchess.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git log --pretty=format:'%h' -n 1)"
}

build() {
  cd "${srcdir}/${_pkgname}/cmake"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}/cmake"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
