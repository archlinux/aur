# Maintainer: Greg White <gwhite@kupulau.com> 
pkgname=postgis-src
_pkgname=${pkgname}
pkgver=2.4.3
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
sha256sums=('ea5374c5db6b645ba5628ddcb08f71d3b3d90a464d366b4e1d20d5a268bde4b9')

build() {
  cd postgis-${pkgver}

  ./configure --without-json --prefix=/usr --with-gdalconfig=/usr/bin/gdal-config --with-gui
  make
}

package() {
  cd postgis-${pkgver}

  make DESTDIR="${pkgdir}" install
#  mkdir -p "${pkgdir}/usr/share/postgresql/extension/" 
#  find . -name "*.control" | xargs cp -vt ${pkgdir}/usr/share/postgresql/extension/
}
