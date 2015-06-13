# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=gwenrename
pkgver=1.1_beta7
_pkgver=1.1-beta7
pkgrel=1
pkgdesc="GwenRename is a renaming tool. It was created as an external tool for GwenView, but it can be used from Dolphin, Konqueror with service menu or as command line parameters."
url="http://www.kde-apps.org/content/show.php/GwenRename?content=11844"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
source=(http://members.hellug.gr/sng/gwenrename/gwenrename-$_pkgver.tar.gz patch)
md5sums=('d7cb53880767c1ff6f81e4d171dcd312'
         'e0f051555da4ea09a5d105ec9f2433c8')

build() {
  cd ${srcdir}/$pkgname-$_pkgver
  patch -Np0 -i ${srcdir}/patch
  rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake4
  make clean 
  make || return 1
}
  
package() {
  cd ${srcdir}/$pkgname-$_pkgver/build
  make DESTDIR=${pkgdir} install || return 1
}
