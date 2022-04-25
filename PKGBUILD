# Maintainer: Baudouin Feildel <baudouin_aur@feildel.fr>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=postgis-old-upgrade
_pkgname="${pkgname%-old-upgrade}"
pkgver=3.2.1
pkgrel=1
_pg_majorver=13
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
)
makedepends=('clang' 'llvm')
optdepends=('perl: for scripts in contrib folder')
options=('!makeflags')
source=("https://download.osgeo.org/postgis/source/$_pkgname-$pkgver.tar.gz")
sha512sums=('e0ea3d2304e71c98dd045a8031946235d9c26a1310e1ffa556db10dfd18378957ee3d88608fba7ff482835d8c8b41d7f7bddaff1279ce0b50cd7634237465b31')
b2sums=('9c49ad518fb968dc4787bedf6480af29c3e70f986df8233ef034f117b8a8920ff6e39dab57813390b813a3d856476634b18e6ce324795839d019a11559155ff5')

build() {
  cd "$_pkgname-$pkgver"

  export PG_CONFIG="/opt/pgsql-${_pg_majorver}/bin/pg_config"

  ./configure --prefix="/opt/pgsql-${_pg_majorver}"
  make
}

package() {
  cd "$_pkgname-$pkgver"

  make DESTDIR="${pkgdir}" install
}
