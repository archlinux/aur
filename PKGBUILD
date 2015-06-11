# Maintainer: archlinux at carstenfeuls dot de
pkgname=kflog
pkgver=4.10.0
pkgrel=1
pkgdesc=" Flight planning and analysis software"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://www.kflog.org/"
license=('custom')
depends=('qt4')
source=('https://github.com/kflog-project/KFLog/archive/4.10.0.tar.gz')
sha256sums=('62bb49f8d41c9b988a4f77981301e14ea5eaa8cbb874ce266dd100f6247703eb')

build() {
  cd "${srcdir}/KFLog-${pkgver}"
  INSTALL_ROOT=${pkgdir}/opt/kflog
  qmake -Wall -nocache -o Makefile kflog.pro 
  make -f Makefile all
}

package() {
  cd "${srcdir}/KFLog-${pkgver}"
  install --mode=755 -d ${pkgdir}/opt/kflog/bin
  install --mode=755 -d ${pkgdir}/opt/kflog/lib
  install --mode=755 -d ${pkgdir}/opt/kflog/logger
  install --mode=755 -d ${pkgdir}/opt/kflog/pics
  install --mode=755 -d ${pkgdir}/opt/kflog/translations
  install --mode=755 -d ${pkgdir}/usr/share/applications
  install --mode=644 kflog/pics/pilot_48.png ${pkgdir}/opt/kflog/pics
  install --mode=644 kflog/kflog.desktop ${pkgdir}/usr/share/applications
  install --mode=755 release/bin/kflog ${pkgdir}/opt/kflog/bin
  cp -d release/lib/* ${pkgdir}/opt/kflog/lib
  make INSTALL_ROOT=${pkgdir}/opt/kflog -f Makefile install
  make INSTALL_ROOT=${pkgdir}/opt/kflog -f Makefile.qmake install_lang
}
