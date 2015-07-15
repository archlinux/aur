# Contributer: giacomogiorgianni@gmail.com 

pkgname=arrowmatcher
pkgver=3.1.0
pkgrel=1
pkgdesc="ballistics software for arrows and bullets"
arch=('i386' 'x86_64')
url="http://opendesktop.org/content/show.php/arrowmatcher?content=144151"
license=('GPL')
depends=('qt4')
makedepends=('cmake' 'gettext' 'automoc4')
options=('')
source=("http://kent.dl.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}2-${pkgver}/${pkgname}2-${pkgver}.tar.gz")
sha1sums=('e8ed9ee08ff5671440c9e3c8267c6551d8c9a653')
#install=$pkgname.install
 
build() {
   
  cd "${pkgname}2-${pkgver}"
  #sed -i '1,1i#include  <QSslError>|' src/webpage.cpp
  qmake-qt4 ${pkgname}2.pro -config release PREFIX=/usr \
  "CONFIG+=LINUX_INTEGRATED" \
  "INSTALL_ROOT_PATH=${pkgdir}"
 
  make all
}
 
package() {
  cd "${pkgname}2-${pkgver}"
  #make INSTALL_ROOT=${pkgdir} install
  mkdir -p ${pkgdir}/usr/{bin,share/doc/packages/${pkgname}2}
  install -D -m755 src/release/${pkgname}2 ${pkgdir}/usr/bin/
  cp -r doc/de ${pkgdir}/usr/share/doc/packages/${pkgname}2/de
  cp -r doc/en ${pkgdir}/usr/share/doc/packages/${pkgname}2/en
  cp doc/${pkgname}2.qhc ${pkgdir}/usr/share/doc/packages/${pkgname}2
}
