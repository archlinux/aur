# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=tcpview
pkgver=3.1.0
pkgrel=1
pkgdesc='Graphical network connections viewer for Linux'
arch=('x86_64')
url='https://github.com/chipmunk-sm/tcpview'
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chipmunk-sm/tcpview/archive/${pkgver}.tar.gz")
sha256sums=('361b6a1edada4b8b7856d762b5847a28a9c3e456eec8683e6863e5dcf2445ce7')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i "21a#include <string>" source/cportservicenames.h
}

build() {
  cd "${pkgname}-${pkgver}"
  rm -rf build
  mkdir build
  cd build
  qmake PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  install -Dm755 tcpview "${pkgdir}/usr/bin/tcpview"
  install -Dm644 ../data/tcpview.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 ../data/tcpview.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
# vim:set ts=2 sw=2 et:
