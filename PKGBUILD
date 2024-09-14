# Contributer: giacomogiorgianni@gmail.com 

pkgname=arrowmatcher
pkgver=3.1.2
pkgrel=1
pkgdesc="ballistics software for arrows and bullets"
arch=('i386' 'x86_64')
url="http://opendesktop.org/content/show.php/arrowmatcher?content=144151"
license=('GPL')
depends=('qt4')
makedepends=('cmake' 'gettext' 'automoc4')
options=()
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgname}2-${pkgver}/${pkgname}2-${pkgver}.tar.gz/download")
sha1sums=('6e18d0907b84a13d200e255820c5caf14b5e258d')
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
