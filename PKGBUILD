# Maintainer: jaco <jaco[at]autistici[dot]org>
pkgname=esr-disc-patcher-qt4-git
pkgver=0.24a
pkgrel=1
pkgdesc="A tool to patch DVD disc images for the Sony PlayStation 2 game console to make them burnable and working with ESR, an app for the PlayStation 2 made to play those burned games without swapping"
license=("GPL3")
url="http://psx-scene.com/forums/f164/esr-disc-patcher-linux-mac-qt4-port-60096/"
depends=('qt4')
makedepends=('git' 'qt4' 'make')
arch=('any')
source=("git://github.com/antipatico/esr-disc-patcher-qt4.git"
        "esr-disc-patcher-qt4.desktop")
md5sums=('SKIP'
         'd1c13874d620685fc20388f47e345ac1')

build() {
  cd "${srcdir}/esr-disc-patcher-qt4"
  git checkout C++11
  qmake-qt4 -project
  qmake-qt4
  make
}

package() {
  install -Dm 644 "${srcdir}/esr-disc-patcher-qt4.desktop" "${pkgdir}/usr/share/applications/esr-disc-patcher-qt4.desktop"

  cd "${srcdir}/esr-disc-patcher-qt4"
  install -Dm 755 esr-disc-patcher-qt4 "${pkgdir}/usr/bin/esr-disc-patcher-qt4"
  install -Dm 644 esr.png "${pkgdir}/usr/share/pixmaps/esr-disc-patcher.png"
}
