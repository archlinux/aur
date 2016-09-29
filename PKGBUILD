# Maintainer: Greg White <gwhite@kupulau.com> 
pkgname=postgis-src
_pkgname=${pkgname}
pkgver=2.3.0
pkgrel=2
pkgdesc="Postgres GIS extensions (from source)"
arch=('i686' 'x86_64')
url="http://postgis.net/"
license=('GPL')
depends=('postgresql' 'gdal' 'geos' 'json-c' 'libxml2' 'libxslt')
optdepends=('gtk2-appmenu: for GTK support')
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname postgis)
source=("http://download.osgeo.org/postgis/source/postgis-${pkgver}.tar.gz")
sha256sums=('0dbff06f4a196d49e5ac06ae6cc21bd5253aaa646af624c9bbf19df582d6cf55')

build() {
  cd postgis-${pkgver}

  ./configure --prefix=/usr --with-gdalconfig=/usr/bin/gdal-config --with-gui
  make
}

package() {
  cd postgis-${pkgver}

  make DESTDIR="${pkgdir}" install
#  mkdir -p "${pkgdir}/usr/share/postgresql/extension/" 
#  find . -name "*.control" | xargs cp -vt ${pkgdir}/usr/share/postgresql/extension/
}
