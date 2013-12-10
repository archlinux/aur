# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=chocolate-doom-git
_pkgname=${pkgname/-git/}
pkgver=2.0.0
pkgrel=1
pkgdesc="Doom, Heretic, Hexen, Strife port accurately reproducing the originals."
arch=('i686' 'x86_64')
url="http://www.chocolate-doom.org/"
license=('GPL2')
depends=('sdl' 'sdl_mixer' 'sdl_net')
makedepends=('git' 'autoconf' 'python')
conflicts=(${_pkgname})
install=${pkgname/-git/}.install
source=(git://github.com/fragglet/chocolate-doom.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  local version=$(git describe)
  local version=${version/chocolate-doom-/}
  local version=${version//-/.}
  echo $version
}

build() {
  cd "${_pkgname}"

  # Change binary dir from /usr/games to /usr/bin
  sed 's|/games|/bin|g' -i src{,/setup}/Makefile.am

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="$pkgdir" install
}
