# Maintainer: Baudouin Feildel <baudouin_aur@feildel.fr>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=postgis-old-upgrade
_pkgname="${pkgname%-old-upgrade}"
pkgver=3.3.2
pkgrel=1
_pg_majorver=14
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
sha512sums=('4dd129057598b032ba322c42888bb8ce14b9423bd450ef7a42fa22162f6b48e34b226f38480aa67fe2da85be2529b0822655855f9846b657bdd32f50256f4305')
b2sums=('40dc7636f04e0d5cfd734b175da1ce49c32e4b8f5750059e79e03a7395fb8b9241c1f479815794b46dee81704d7c392fe7693c9f0180323d1ca21812c37d36b5')

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
