# Maintainer: M0Rf30

pkgname=ccdebug
pkgver=1.3.3
pkgrel=1
pkgdesc="A Qt-based graphical gdb debugger frontend"
arch=('i686' 'x86_64')
url="http://ccdebug.sourceforge.net/"
license=('LGPL')
depends=('qt4' 'gdb')
source=("http://prdownloads.sourceforge.net/project/ccdebug/${pkgname}_${pkgver}_src.tgz"
	patch)


package() {
  cd $srcdir/${pkgname}_${pkgver}
  patch -Np1 -i ../patch
  ./configure --prefix=/usr
  qmake-qt4 LINK_PREFIX=/usr PREFIX=/usr INSTALL_DIR=$pkgdir/usr/bin
  make
  make INSTALL_ROOT="${pkgdir}" install  
  mv $pkgdir/usr/local/bin $pkgdir/usr/ && rm -r $pkgdir/usr/local
  cd migdbplugin/
  make INSTALL_DIR=$pkgdir/usr/bin
  make INSTALL_DIR=$pkgdir/usr/bin install  
}

md5sums=('db6eb7e5c8175bd61495ed40568eee5f'
         '3e51d0498f1600b24f0e957b6e0dc2e8')
