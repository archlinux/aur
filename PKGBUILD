# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

_name=easyrpg-player
pkgname=$_name-git
pkgver=0.2.r3.g6b3a8d5
pkgrel=1
pkgdesc="FLOSS RPG Maker 2000/2003 and EasyRPG games interpreter (development version)"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('GPL3')
conflicts=("$_name")
provides=("$_name=${pkgver%.r*}")
makedepends=('boost' 'git')
depends=('liblcf-git' 'sdl2_mixer' 'pixman')
install=$_name.install
source=($_name::"git+https://github.com/EasyRPG/Player.git")
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/-/.r/;s/-/./'
}

build () {
  cd $_name

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package () {
  make -C $_name DESTDIR="$pkgdir/" install
}
