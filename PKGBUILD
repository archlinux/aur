# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
pkgver=0.9.5beta3
pkgrel=1
pkgdesc="Digital photo management application for kde"
arch=(i686 x86_64)
license=('GPL')
url="http://digikam.sourceforge.net"
depends=('sqlite3' 'libkipi>=0.1.6' 'libgphoto2' 'exiv2>=0.17.1' 'lcms' 'dcraw' 'libkexiv2>=0.1.7' 'jasper>=1.900.1' 'lcms' 'libkdcraw>=0.1.4')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/digikam/${pkgname}-0.9.5-beta3.tar.bz2)
replaces=('digikamimageplugins')

build() {
  cd ${startdir}/src/${pkgname}-0.9.5-beta3
   
   #Optimisations which work for i686 only
   if [ "$CARCH" = "i686" ]; 
   then ./configure --prefix=/opt/kde --disable-debug --enable-gcc-hidden-visibility --without-included-sqlite3 --without-arts
   else ./configure --prefix=/opt/kde --disable-debug --without-included-sqlite3 --without-arts
   fi
   
   make || return 1
   make DESTDIR=${startdir}/pkg/ install
 }
md5sums=('a69a06c5cb37ef496e23c684a5f10d60')
