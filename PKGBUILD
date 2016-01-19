# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Philipp Überbacher <murks at lavabit dot com>
_pkgbasename=klick
pkgname=${_pkgbasename}-git
pkgver=r174.c050710
pkgrel=2
pkgdesc="An advanced command-line based metronome for JACK"
arch=('i686' 'x86_64')
url="http://das.nasophon.de/klick/"
license=('GPL')
depends=('jack' 'liblo' 'rubberband')
makedepends=('scons' 'boost')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
source=("${_pkgbasename}::git://github.com/dsacre/klick.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbasename}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgbasename}"

  scons PREFIX="/usr"
}

package() {
  cd "${srcdir}/${_pkgbasename}"

  scons DESTDIR=${pkgdir} install
}

