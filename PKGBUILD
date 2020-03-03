# Maintainer: Greg White <gwhite@kupulau.com> 
pkgname=postgis-src
_pkgname=${pkgname}
pkgver=3.0.1
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
sha256sums=('5a5432f95150d9bae9215c6d1c7bb354e060482a7c379daa9b8384e1d03e6353')

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
