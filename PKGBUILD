# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: ekse <ekse.0x[AT]gmail[DOT]com>
# Maintainer: mirandir <mirandir[AT]orange[DOT]fr>

pkgname=jumpnbump
pkgver=1.60
pkgrel=7
pkgdesc="You, as a bunny, have to jump on your opponents to make them explode. It's a true multiplayer game which can't be played alone. It has network support. This program is a Unix port of the old DOS game by brainchilddesign. SDL2 port."
arch=('i686' 'x86_64')
url="https://libregames.gitlab.io/jumpnbump/"
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'sdl2_net' 'pygtk')
optdepends=('jumpnbump-levels: more levels for jumpnbump')
conflicts=('jumpnbump-menu')
source=(https://gitlab.com/LibreGames/jumpnbump/uploads/9f3a356c52f433e3af10f1ef800fce5d/jumpnbump-${pkgver}.tar.xz menu.patch desktop.patch)
sha256sums=('174891415af2c4db683c657001f83a0efc64a56fafc4ba543709b9d9ff92b655'
            '824c16bd23e2cac4d5f9f6fc891f915f2fc5b64a2a27bddcc457cf614350fb34'
            '0290fbb0eaac2aaf4d962e72282889eb6f0655db6918910762739004f9581da0')

build() {
  cd $srcdir/${pkgname}-${pkgver}/menu
  patch -p0 < ../../../menu.patch || return 1
  
  cd "${srcdir}/${pkgname}-${pkgver}/"
  
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr/" install
  
  cd ${pkgdir}/usr/share/applications/
  rm "jumpnbump.desktop"
  patch -p0 < ${srcdir}/desktop.patch || return 1
}
