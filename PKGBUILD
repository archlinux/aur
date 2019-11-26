# Maintainer: Baudouin Feildel <baudouin_aur@feildel.fr>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=postgis-old-upgrade
pkgver=2.5.3
pkgrel=1
pg_majorver=11
pkgdesc="Postgis build against postgresql-old-upgrade package for pg_upgrade"
arch=('x86_64')
url="http://postgis.net/"
license=('GPL')
depends=('postgresql-old-upgrade' 'gdal' 'json-c' 'proj' 'protobuf-c')
changelog=$pkgname.changelog
options=('!makeflags')
source=(http://download.osgeo.org/postgis/source/${pkgname/-old-upgrade/}-${pkgver}.tar.gz)
sha256sums=('72e8269d40f981e22fb2b78d3ff292338e69a4f5166e481a77b015e1d34e559a')

build() {
  cd ${pkgname/-old-upgrade/}-${pkgver}

  export PG_CONFIG="/opt/pgsql-${pg_majorver}/bin/pg_config"

  ./configure --prefix="/opt/pgsql-${pg_majorver}"
  make
}

package() {
  cd ${pkgname/-old-upgrade/}-${pkgver}

  make DESTDIR="${pkgdir}" install
}
