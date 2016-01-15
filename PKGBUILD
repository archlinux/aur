# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Gunther Schulz < mail at guntherschulz.de > 
# Contributor: Kévin Guilloy <kevin at guilloy dot ath dot cx>

pkgname=qwtpolar
pkgver=1.1.1
pkgrel=1
pkgdesc='Qwt library that contains classes for displaying values on a polar coordinate system'
arch=('i686' 'x86_64')
url='http://qwtpolar.sourceforge.net/'
license=('custom:Qwt License, Version 1.0')
depends=('qt4' 'qwt')
source=("http://sourceforge.net/projects/qwtpolar/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
sha1sums=('38edf5220c971eef0e88fcc6db7c718e6198ccac')

build() {
  cd $pkgname-$pkgver

  sed -i -e 's/$${QWT_POLAR_INSTALL_PREFIX}\/doc/\/usr\/share\/doc\/qwt\//' qwtpolarconfig.pri
  sed -i -e 's/$${QWT_POLAR_INSTALL_PREFIX}\/include/\/usr\/include\/qwt\//' qwtpolarconfig.pri
  sed -i -e 's/$${QWT_POLAR_INSTALL_PREFIX}\/lib/\/usr\/lib\//' qwtpolarconfig.pri
  sed -i -e 's/$${QWT_POLAR_INSTALL_PREFIX}\/features/\/usr\/share\/qwt\/features\//' qwtpolarconfig.pri
  sed -i -e 's/^.*QwtPolarDesigner//' qwtpolarconfig.pri
  sed -i -e 's/^.*QwtPolarExamples//' qwtpolarconfig.pri
  echo "INCLUDEPATH += /usr/include" >> qwtpolarbuild.pri

  qmake-qt4 qwtpolar.pro
  make
}

package() {
  cd $pkgname-$pkgver

  make INSTALL_ROOT="${pkgdir}"/ install
}
