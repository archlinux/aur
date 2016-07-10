# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-player-git
pkgver=0.4.1.r363.g69e6135
pkgrel=1
pkgdesc="FLOSS RPG Maker 2000/2003 and EasyRPG games interpreter (development version)"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('GPL3')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}=${pkgver%.r*}")
makedepends=('git' 'asciidoc')
depends=('liblcf-git' 'sdl2_mixer' 'pixman' 'freetype2' 'mpg123' 'speexdsp' 'libsndfile')
optdepends=('wine: for installing the run time packages (RTP)')
install=$pkgname.install
source=(${pkgname%-*}::"git+https://github.com/EasyRPG/Player.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  git describe --long | sed 's/-/.r/;s/-/./'
}

build () {
  cd ${pkgname%-*}

  autoreconf -i
  ./configure --prefix=/usr --enable-fmmidi=fallback
  make
}

package () {
  make -C ${pkgname%-*} DESTDIR="$pkgdir/" install
}
