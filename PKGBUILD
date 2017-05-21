# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: ekse <ekse.0x[AT]gmail[DOT]com>
# Maintainer: mirandir <mirandir[AT]orange[DOT]fr>

pkgname=jumpnbump
pkgver=1.60
pkgrel=5
pkgdesc="You, as a bunny, have to jump on your opponents to make them explode. It's a true multiplayer game which can't be played alone. It has network support. This program is a Unix port of the old DOS game by brainchilddesign. SDL2 port."
arch=('i686' 'x86_64')
url="https://github.com/MCMic/jumpnbump"
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'sdl2_net')
optdepends=('jumpnbump-levels: more levels for jumpnbump')
conflicts=('jumpnbump-menu')
source=(jumpnbump::git+https://gitlab.com/LibreGames/jumpnbump.git menu.patch desktop.patch)
sha256sums=('SKIP'
            '824c16bd23e2cac4d5f9f6fc891f915f2fc5b64a2a27bddcc457cf614350fb34'
            'e8c4fa81af736eca98c49b0e9a36fba79f7bcd5cb1909af30f4e039a5863798c')

build() {
  cd $srcdir/${pkgname}/menu
  patch -p0 < ../../../menu.patch || return 1
  
  cd "${srcdir}/${pkgname}/"
  
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}"
  make PREFIX="${pkgdir}/usr/" install
  
  cd ${pkgdir}/usr/share/applications/
  rm "jumpnbump.desktop"
  patch -p0 < ${srcdir}/desktop.patch || return 1
}
