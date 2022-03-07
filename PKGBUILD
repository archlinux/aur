# Contributor: Edward Pacman <edward at edward-p dot xyz>
# Contributor: lilac <lilac@build.archlinuxcn.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=kicad-i18n-git
pkgver=r1879.e89d9a8
pkgrel=5
pkgdesc="Translations for KiCad source code."
arch=('any')
url="http://kicad-pcb.org/"
license=('GPL')
depends=('kicad')
makedepends=('cmake' 'git' 'gettext')
source=('git+https://gitlab.com/kicad/code/kicad-i18n.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list HEAD --count --first-parent)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git}
  [[ -d build ]] || mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${pkgname%-git}
  cd build
  make DESTDIR="${pkgdir}" install
}
