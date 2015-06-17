# Samuel Fernando Mesa Giraldo <samuelmesa [at] linuxmail.org>

pkgname=tinyows
pkgver=1.1.0
pkgrel=3
pkgdesc="A lightweight and fast implementation of the OGC WFS-T specification."
arch=('i686' 'x86_64')
url=('http://mapserver.org/tinyows')
install=tinyows.install 
license=('MIT')
depends=( 'libxml2' 'postgis' 'apache' 'fcgi' )
optdepends=()
makedepends=('git' 'cmake')
provides=('mapserver')
conflicts=('tinyows')

source=("http://download.osgeo.org/mapserver/tinyows-1.1.0.tar.bz2")
md5sums=('9af531d2aed80a0b5dd390032c9c5477')

build() {
  
  cd ${startdir}/src/${pkgname}-${pkgver}

  msg "Compiling ...."
	
  ./configure --prefix=/$pkgdir/usr \
              --with-xml2-config=/usr/bin/xml2-config \
              --with-pg_config=/usr/bin/pg_config \
              --with-shp2pgsql=/usr/bin/shp2pgsql \
              --with-fastcgi

        make
}

package() {  
  
  cd $srcdir/$pkgname-${pkgver}
  make DESTDIR=$pkgdir install  

  install -Dm755 tinyows "$pkgdir/usr/bin/tinyows"
  mkdir -p  "$pkgdir/usr/share/tinyows" 
  cp -rfv demo "$pkgdir/usr/share/tinyows" 
}

