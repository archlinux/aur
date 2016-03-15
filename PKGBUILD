# Maintainer: Archadept
#   Revision: 2016-03-15

pkgname=wesnoth-git
_gitname=wesnoth
pkgver=1.13.4.104.g3f58231
pkgrel=1
pkgdesc="The latest version of a turn-based strategy game on a fantasy world"
arch=('x86_64')
url="http://www.wesnoth.org/"
license=('GPL')
depends=('boost' 'boost-libs' 'fribidi' 'sdl2' 'sdl2_ttf' 'sdl2_net' 'sdl2_mixer' 'sdl2_image' 'libvorbis' 'pango' 'python')
makedepends=('openssh' 'scons' 'git')
conflicts=('wesnoth' 'wesnoth-data' 'wesnoth-devel')
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

  scons prefsdir=.config/$pkgname prefix=/usr debug=yes || return 1
  scons destdir=${pkgdir} install || return 1

  cd ${pkgdir}

  rm -R var
}
