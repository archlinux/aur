# Maintainer: Marti Raudsepp <marti@juffo.org>
# Maintainer: peippo <christoph.fink@gmail.com>
pkgname=postgis-git
pkgver=3.1.0rc1.r48.g5148c43e3
pkgrel=1

pkgdesc="Postgres GIS extensions (from git)"
url="https://postgis.net/"
license=('GPL')

arch=('i686' 'x86_64')
depends=('postgresql' 'protobuf-c' 'gdal' 'geos' 'json-c' 'libxml2' 'libxslt')
makedepends=('clang' 'git' 'llvm')

conflicts=('postgis')
provides=('postgis')
replaces=('postgis-svn')

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
