# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=easyrpg-player
pkgname=$_pkgbase-git
pkgver=0.1.2.r212.g3fda9dd
pkgrel=1
pkgdesc="FLOSS RPG Maker 2000/2003 and EasyRPG games interpreter (development version)"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('GPL3')
conflicts=("$_pkgbase")
provides=("$_pkgbase")
makedepends=('boost' 'git' 'liblcf-git')
depends=('sdl2_mixer' 'freetype2' 'pixman' 'expat')
optdepends=('wine: to use RTP(E) installed with wine')
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
  # temporarily fix liblcf path+linking
  CPPFLAGS="$CPPFLAGS -I/usr/include/liblcf" LIBS="-llcf -lexpat" \
    ./configure --prefix=/usr
  make
}

package () {
  install -Dm755 $_pkgbase/src/$_pkgbase "$pkgdir"/usr/bin/$_pkgbase
}
