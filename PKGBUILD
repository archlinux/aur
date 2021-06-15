# Maintainer: Baudouin Feildel <baudouin_aur@feildel.fr>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=postgis-old-upgrade
_pkgname="${pkgname%-old-upgrade}"
pkgver=3.1.2
pkgrel=1
pg_majorver=12
pkgdesc="Postgis build against postgresql-old-upgrade package for pg_upgrade"
arch=('x86_64')
url="http://postgis.net/"
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
changelog=$pkgname.changelog
options=('!makeflags')
source=("https://download.osgeo.org/postgis/source/$_pkgname-$pkgver.tar.gz")
sha256sums=('2cdd3760176926704b4eb25ff3357543c9637dee74425a49082906857c7e0732')

build() {
  cd "$_pkgname-$pkgver"

  export PG_CONFIG="/opt/pgsql-${pg_majorver}/bin/pg_config"

  ./configure --prefix="/opt/pgsql-${pg_majorver}"
  make
}

package() {
  cd "$_pkgname-$pkgver"

  make DESTDIR="${pkgdir}" install
}
