# Maintainer: Archadept
#   Revision: 2017-03-22

pkgname=wesnoth-git
_gitname=wesnoth
pkgver=1.13.7.34.g9a288ab78c
pkgrel=1
pkgdesc="The latest version of a turn-based strategy game on a fantasy world"
arch=('x86_64')
url="http://www.wesnoth.org/"
license=('GPL')
depends=('boost' 'boost-libs' 'fribidi' 'sdl2' 'sdl2_ttf' 'sdl2_net' 'sdl2_mixer' 'sdl2_image' 'libvorbis' 'pango' 'python')
makedepends=('openssh' 'scons' 'git' 'gcc')
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
  cd ${_gitname}-build

  scons prefsdir=.local/share/$_gitname/git prefix=/usr debug=yes || return 1
  scons destdir=${pkgdir} install || return 1

  cd ${pkgdir}

  rm -R var
}
