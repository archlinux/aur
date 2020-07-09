# Maintainer: Allen Choong <allen.choong at gmail dot com>

pkgname=klatexformula
pkgver=4.1.0
pkgrel=1
pkgdesc="Provides GUI for generating images from LaTeX equations"
arch=(x86_64)
url='https://klatexformula.sourceforge.io/'
license=(GPL2)
depends=(ghostscript python qt5-svg texlive-core)
makedepends=(cmake qt5-tools qt5-x11extras)
source=(https://downloads.sourceforge.net/klatexformula/$pkgname-$pkgver.tar.gz)
sha256sums=('7af0999eeee38176ea34f9f96b358e43e343c73edf6f56143f18794303ca8702')

prepare() {
  cd $pkgname-$pkgver
  sed -i "41i#include <QPainterPath>" src/klftools/klfflowlistwidget_p.h
}

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
