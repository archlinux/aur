# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mapmap
pkgver=0.6.2
pkgrel=1
pkgdesc='Open source video mapping software'
arch=('x86_64')
url="http://www.mapmap.info"
license=('GPL3')
depends=('gst-libav'
         'gstreamer-vaapi'
         'gst-plugins-bad'
         'gst-plugins-good'
         'gst-plugins-ugly'
         'qt5-tools'
         'qt5-multimedia'
         'liblo')
makedepends=('qt5-base'
             'doxygen'
             'graphviz')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mapmapteam/mapmap/archive/${pkgver}.tar.gz")
sha256sums=('2f1b8236d448b6839395fd78b1d407c034749a549666270f2a17e6b5f2d25c78')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i "21a#include <QPainterPath>" src/gui/MappingItemDelegate.cpp
  sed -i '50,61s/^#  //' mapmap.pro
}

build() {
  cd "${pkgname}-${pkgver}"
  qmake PREFIX="/usr"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
# vim:set ts=2 sw=2 et: