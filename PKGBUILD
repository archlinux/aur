# Maintainer: Adam Reichold <adam.reichold@t-online.de>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=qpdfview-bzr
pkgver=2070
pkgrel=1
pkgdesc="A tabbed PDF viewer using the poppler library (development version)"
url="https://launchpad.net/qpdfview"
arch=(x86_64)
license=(GPL-2.0-or-later)
provides=('qpdfview')
conflicts=('qpdfview')
depends=(libcups libsynctex poppler-qt6 qt6-svg)
makedepends=(qt6-tools libspectre djvulibre breezy)
optdepends=('libspectre: for PostScript support'
  'djvulibre: for DjVu support')
source=('qpdfview::bzr+http://bazaar.launchpad.net/~adamreichold/qpdfview/trunk/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/qpdfview"

  bzr revno
}

prepare() {
  sed -i 's/CONFIG += c++11/CONFIG += c++17/' qpdfview/qpdfview.pri
}

build() {
  cd "$srcdir/qpdfview"
  /usr/lib/qt6/bin/lrelease qpdfview.pro
  qmake6 qpdfview.pro
  make
}

package() {
  cd "$srcdir/qpdfview"
  make INSTALL_ROOT="$pkgdir" install
}
