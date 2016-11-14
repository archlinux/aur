# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Knut Franke <Knut.Franke ad gmx dot de>
# Contributor: Olaf Leidinger <leidola at newcon dot de>
# Contributor: Robal <nigrantis.tigris at gmail dot com>
# Contributor: Alexander <chronischzuspaet at gmail dot com> Kempen

pkgname=scidavis
pkgver=1.14
pkgrel=2
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of QtiPlot"
arch=('i686' 'x86_64')
url="http://scidavis.sourceforge.net/"
license=('GPL')
makedepends=('boost' 'cmake')
depends=('gsl' 'glu' 'mesa' 'muparser' 'python2-pyqt4' 'shared-mime-info'
         'qt-assistant-compat' 'qwt5' 'qwtplot3d')
source=(http://prdownloads.sourceforge.net/sourceforge/scidavis/${pkgname}-${pkgver}.tar.gz
        scidavis-qwt5.patch)
md5sums=('6b5fd39c17ed67cd64c77ac214099b2e'
         '28877fda6842869aa07d0bec50c49fa5')
install=${pkgname}.install

prepare() {
  # fix qwt
  patch -p0 -i "scidavis-qwt5.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  qmake-qt4
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install

  # remove liborigin files since it uses static library
  rm -rf "${pkgdir}/usr/local"

  # install desktop file and icon
  install -Dm644 "scidavis/scidavis.desktop" "${pkgdir}/usr/share/applications/scidavis.desktop"
  install -Dm644 "scidavis/icons/scidavis.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/scidavis.svg"
}


