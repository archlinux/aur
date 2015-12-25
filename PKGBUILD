# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-tools-git
pkgver=r70.4676147
pkgrel=1
pkgdesc="EasyRPG tools to convert RPG Maker 2000/2003 files (development version)"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('MIT' 'GPL3' 'custom')
conflicts=('lcf2xml')
provides=('lcf2xml' 'lmu2png' 'png2xyz' 'xyz2png')
makedepends=('git')
depends=('gcc-libs' 'liblcf-git' 'sdl2_image' 'libpng')
source=(${pkgname#-*}::"git+https://github.com/EasyRPG/tools.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname#-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd ${pkgname#-*}

  ./bootstrap
  ./configure --prefix=/usr
  make
}

package () {
  cd ${pkgname#-*}

  make DESTDIR="$pkgdir" install

  # licenses
  install -Dm0644 lmu2png/COPYING "$pkgdir"/usr/share/licenses/$pkgname/lmu2png-COPYING
  install -Dm0644 lcf2xml/COPYING "$pkgdir"/usr/share/licenses/$pkgname/lcf2xml-COPYING
}
