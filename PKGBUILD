# Maintainer: Archadept
#   Revision: 2016-05-29

pkgname=wesnoth-git
_gitname=wesnoth
pkgver=1.13.4.830.g617d22e
pkgrel=1
pkgdesc="The latest version of a turn-based strategy game on a fantasy world"
arch=('x86_64')
url="http://www.wesnoth.org/"
license=('GPL')
depends=('boost' 'boost-libs' 'fribidi' 'sdl2' 'sdl2_ttf' 'sdl2_net' 'sdl2_mixer' 'sdl2_image' 'libvorbis' 'pango' 'python')
makedepends=('openssh' 'cmake' 'git' 'gcc')
conflicts=('wesnoth' 'wesnoth-data')
provides=('wesnoth')

source=('git://github.com/wesnoth/wesnoth.git')
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --always | sed 's/-/./g'
}

build() {
  cd "${srcdir}"

  rm -rf ${srcdir}/$_gitname-build
  cp -r ${_gitname} ${_gitname}-build || return 1
}

package() {
  cd "$srcdir/$_gitname-build/cmake"

  cmake .. -DPREFERENCES_DIR=.local/share/wesnoth/git -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
  make
  make install
}
