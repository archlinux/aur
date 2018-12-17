# Maintainer: Baudouin Feildel <baudouin_aur@feildel.fr>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=postgis-old-upgrade
pkgver=2.5.1
pkgrel=1
pg_majorver=10
pkgdesc="Postgis build against postgresql-old-upgrade package for pg_upgrade"
arch=('x86_64')
url="http://postgis.net/"
license=('GPL')
depends=('postgresql-old-upgrade' 'gdal' 'json-c' 'proj' 'protobuf-c')
changelog=$pkgname.changelog
options=('!makeflags')
source=(http://download.osgeo.org/postgis/source/${pkgname/-old-upgrade/}-${pkgver}.tar.gz)
sha256sums=('fb137056f43aae0e9d475dc5b7934eccce466f86f5ceeb69ec8b5cea26817a91')

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
