# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Allen Choong <allencch at hotmail dot com>

pkgname=qwebapp-git
pkgver=ea398e2
pkgrel=1
pkgdesc="Fast and slick customizable minimalistic web browser used for making desktop launchers for web apps. Works on Linux, Windows and Mac OS X."
url="https://gitlab.com/zatherz/qwebapp.git"
arch=('i686' 'x86_64')
license=('GPL2')
provides=('qwebapp')
conflicts=('qwebapp')
depends=('qt5-base' 'qt5-webkit')
source=(${pkgname}::git+https://gitlab.com/zatherz/qwebapp.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --always|sed 's|-|.|g'|sed -r 's|v(.*)|\1|'
}

build() {
  cd ${pkgname}
  if [ ! -e "build" ]; then
    mkdir build
  fi
  cd build
  qmake-qt5 ..
  make
}

package() {
  cd ${pkgname}
  if [ ! -e "${pkgdir}/usr/bin" ]; then
    mkdir -p "${pkgdir}/usr/bin"
  fi
  cp build/qwebapp "${pkgdir}/usr/bin"
}

# vim: ts=2 sw=2 et:
