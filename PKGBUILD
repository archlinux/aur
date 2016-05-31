# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Knut Franke <Knut.Franke ad gmx dot de>
# Contributor: Olaf Leidinger <leidola at newcon dot de>
# Contributor: Robal <nigrantis.tigris at gmail dot com>
# Contributor: Alexander <chronischzuspaet at gmail dot com> Kempen

pkgname=scidavis
pkgver=1.D9
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of QtiPlot"
arch=('i686' 'x86_64')
url="http://scidavis.sourceforge.net/"
license=('GPL')
makedepends=('boost' 'cmake')
depends=('gsl' 'glu' 'mesa' 'muparser' 'python2-pyqt4' 'shared-mime-info'
         'qt-assistant-compat' 'qwt5' 'qwtplot3d')
source=(http://prdownloads.sourceforge.net/sourceforge/scidavis/${pkgname}.${pkgver}.tar.gz
        scidavis-tableitem.patch
        scidavis-python.patch
        scidavis-qtassistant.patch
        scidavis-qwt5.patch)
install=${pkgname}.install
md5sums=('fccb771fea021a61055d554db6230b51'
         '5948728d8281089cc32e168c5b83d339'
         'bf3725530f5d66c7234232ba5500b308'
         '14199d381631fa2db8450a66ea5ca1cc'
         'f9b3979ee4e255b0dc2d26f1b5ff82c2')
prepare() {
  # python patch
  patch -p0 -i "scidavis-python.patch"
  # fix qtassistant
  patch -p0 -i "scidavis-qtassistant.patch"
  # fix qwt
  patch -p0 -i "scidavis-qwt5.patch"
  # fix table item attributes
  patch -p0 -i "scidavis-tableitem.patch"
}

build() {
  cd "${pkgname}.${pkgver}"
  qmake-qt4
  make
}

package() {
  cd "${pkgname}.${pkgver}"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install

  # remove liborigin files since it uses static library
  rm -rf "${pkgdir}/usr/local"
}

