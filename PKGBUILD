# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
_name=asteroid
pkgname="${_name}-git"
pkgver=1.2.1.4.g0e37197
pkgrel=1
pkgdesc="A modern version of the arcade classic Asteroids"
arch=('i686' 'x86_64')
url="http://chazomaticus.github.io/asteroid/"
license=('GPLv3')
depends=('freeglut' 'gtk2' 'hicolor-icon-theme' 'sdl_mixer')
makedepends=('git' 'cmake')
source=("${_name}::git+https://github.com/chazomaticus/${_name}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "${_name}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  sed -i 's_lcairo_lcairo -lm_' CMakeFiles/asteroid.dir/link.txt
}

package() {
  cd "${_name}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}

# vim:set ts=2 sw=2 et:
