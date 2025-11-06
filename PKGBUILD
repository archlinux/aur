# Maintainer: Guillermo Durán <gds506@gmail.com>
# Previous Maintainer: Baudouin Feildel <baudouin_aur@feildel.fr>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=postgis-old-upgrade
_pkgname="${pkgname%-old-upgrade}"
pkgver=3.6.0
pkgrel=3
_pg_majorver=17
pkgdesc='PostGIS build against postgresql-old-upgrade package for pg_upgrade'
arch=('x86_64')
url='https://postgis.net/'
license=('GPL')
depends=(
  'postgresql-old-upgrade'
  'gdal'
  'json-c'
  'proj'
  'protobuf-c'
  'pcre'
  'libxml2'
  'libc++'
)
makedepends=('clang' 'llvm')
optdepends=('perl: for scripts in contrib folder')
options=('!makeflags')
source=("https://download.osgeo.org/postgis/source/$_pkgname-$pkgver.tar.gz")
md5sums=('469182b48dddf39c8d26da2e3cca9781')
build() {
  cd "$_pkgname-$pkgver"

  export PG_CONFIG="/opt/pgsql-${_pg_majorver}/bin/pg_config"
  export CXXFLAGS="$CXXFLAGS -std=c++17"

  ./configure --prefix="/opt/pgsql-${_pg_majorver}"

  make
}

package() {
  cd "$_pkgname-$pkgver"

  make DESTDIR="${pkgdir}" install
}
