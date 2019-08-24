# Maintainer: Greg White <gwhite@kupulau.com> 
pkgname=postgis-src
_pkgname=${pkgname}
pkgver=2.5.3
pkgrel=4
pkgdesc="Postgres GIS extensions (from source)"
arch=('i686' 'x86_64')
url="http://postgis.net/"
license=('GPL')
depends=('postgresql' 'gdal' 'geos' 'json-c' 'libxml2' 'libxslt' 'protobuf-c' 'sfcgal')
optdepends=('gtk2-appmenu: for GTK support')
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname postgis)
source=("http://download.osgeo.org/postgis/source/postgis-${pkgver}.tar.gz")
sha256sums=('72e8269d40f981e22fb2b78d3ff292338e69a4f5166e481a77b015e1d34e559a')

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
