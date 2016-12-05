# Maintainer: SaultDon <sault.don gmail>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=postgis-sfcgal
_pkgname=${pkgname%-sfcgal}
pkgver=2.3.1
pkgrel=1
pkgdesc="Adds support for geographic objects to PostgreSQL and includes SFCGAL support for experimental 3D functions"
arch=('i686' 'x86_64')
url="http://postgis.net/"
license=('GPL')
depends=('postgresql' 'gdal' 'geos' 'json-c' 'sfcgal' 'libxml2' 'libxslt')
changelog=$pkgname.changelog
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname)
source=("http://download.osgeo.org/postgis/source/${_pkgname}-${pkgver}.tar.gz")
md5sums=('29d78ebf4542af94ad518508a27d47af')

build() {
  cd ${_pkgname}-${pkgver}

  ./autogen.sh
  ./configure --prefix=/usr --with-raster --with-gdalconfig=/usr/bin/gdal-config --with-gui
  make
}

package() {
  cd ${_pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}
