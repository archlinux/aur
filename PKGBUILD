pkgname=geos-php
pkgver=3.5.0
pkgrel=1
pkgdesc="PHP bindings for geos"
arch=('i686' 'x86_64')
url="http://trac.osgeo.org/geos/"
license=('LGPL')
makedepends=('php')
depends=("geos")
source=(http://download.osgeo.org/geos/geos-$pkgver.tar.bz2)
sha256sums=('49982b23bcfa64a53333dab136b82e25354edeb806e5a2e2f5b8aa98b1d0ae02')

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
