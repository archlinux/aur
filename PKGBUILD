# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=smc-git
pkgver=210.a0405c9
pkgrel=1
pkgdesc="Secret Maryo Chronicles"
arch=('i686' 'x86_64')
url="http://www.secretmaryo.org"
license=('GPL3')
depends=('sdl_image' 'sdl_ttf' 'sdl_mixer' 'cegui-0.7' 'boost-libs' 'libgl')
makedepends=('boost' 'git')
conflicts=('smc')
source=("smc"::"git://github.com/FluXy/SMC.git" "smc.desktop")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd smc
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd smc/smc

  ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  cd smc/smc

  make DESTDIR="$pkgdir/" install

  # man and .desktop
  install -Dm644 makefiles/unix/man/smc.6 "$pkgdir"/usr/share/man/man6/smc.6
  install -Dm644 makefiles/unix/smc.xpm "$pkgdir"/usr/share/pixmaps/smc.xpm
  install -Dm644 ../../smc.desktop "$pkgdir"/usr/share/applications/smc.desktop
}
