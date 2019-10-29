# Maintainer: Marti Raudsepp <marti@juffo.org>
pkgname=postgis-git
pkgver=76e34fa54
pkgrel=1

pkgdesc="Postgres GIS extensions (from git)"
url="https://postgis.net/"
license=('GPL')

arch=('i686' 'x86_64')
depends=('postgresql' 'gdal' 'geos' 'json-c' 'libxml2' 'libxslt')
makedepends=('git')
conflicts=('postgis')
provides=('postgis')

source=("${pkgname}::git+https://git.osgeo.org/gitea/postgis/postgis.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
