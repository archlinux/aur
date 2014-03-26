# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=easyrpg-player
pkgname=$_pkgbase-git
pkgver=0.1.2.r219.g81330d0
pkgrel=1
pkgdesc="FLOSS RPG Maker 2000/2003 and EasyRPG games interpreter (development version)"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('GPL3')
conflicts=("$_pkgbase")
provides=("$_pkgbase")
makedepends=('boost' 'git')
depends=('liblcf-git' 'sdl2_mixer' 'freetype2' 'pixman' 'expat')
install=$_pkgbase.install
source=($_pkgbase::"git+https://github.com/EasyRPG/Player.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long | sed 's/-/.r/;s/-/./'
}

build () {
  cd $_pkgbase

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package () {
  cd $_pkgbase

  make DESTDIR="$pkgdir/" install
}
