# Maintainer: peippo <christoph.fink@gmail.com>
pkgname=postgis-svn
pkgver=r16091
pkgrel=1

pkgdesc="Postgres GIS extensions (from svn)"
url="http://postgis.net/"
license=('GPL')

arch=('i686' 'x86_64')
depends=('postgresql' 'gdal' 'geos' 'json-c' 'libxml2' 'libxslt')
makedepends=('subversion')
conflicts=('postgis')
provides=('postgis')

source=("${pkgname}::svn+http://svn.osgeo.org/postgis/trunk/")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${pkgname}"
  ./autogen.sh 
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
