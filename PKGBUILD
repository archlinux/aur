pkgname=geos-php
pkgver=3.4.2
pkgrel=1
pkgdesc="PHP bindings for geos"
arch=('i686' 'x86_64')
url="http://www.osgeo.org/"
license=('LGPL')
makedepends=('php')
depends=("geos")
source=(http://download.osgeo.org/geos/geos-$pkgver.tar.bz2)
md5sums=('fc5df2d926eb7e67f988a43a92683bae')

build() {
   cd $srcdir/geos-$pkgver/

   ./configure --prefix=/usr/ --enable-php
   make
}

package() {
   /usr/bin/install -D -m 755 $srcdir/geos-$pkgver/php/.libs/geos.so "$pkgdir"`php-config --extension-dir`/geos.so

   mkdir -p $pkgdir/etc/php/conf.d/
   echo ';extension=geos.so' > $pkgdir/etc/php/conf.d/geos.ini
}
