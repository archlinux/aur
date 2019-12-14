# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Philipp Überbacher <murks at lavabit dot com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgbasename=klick
pkgname=${_pkgbasename}-git
pkgver=r174.c050710
pkgrel=3
pkgdesc="An advanced command-line based metronome for JACK"
arch=('i686' 'x86_64')
url="http://das.nasophon.de/klick/"
license=('GPL')
depends=('jack' 'liblo' 'rubberband')
makedepends=('boost' 'git' 'scons')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
source=("${_pkgbasename}::git://github.com/dsacre/klick.git"
        'klick-sconstruct-py3.patch')
sha256sums=('SKIP'
            '29d59dfb3cae6b8e0e77362391280ef32a18b3f7e33413921917ce465c5543e9')

pkgver() {
  cd "${srcdir}/${_pkgbasename}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgbasename}"

  patch -p1 -N -i "${srcdir}"/klick-sconstruct-py3.patch
}

build() {
  cd "${srcdir}/${_pkgbasename}"

  scons PREFIX="/usr"
}

package() {
  cd "${srcdir}/${_pkgbasename}"

  scons DESTDIR="${pkgdir}" install
}
