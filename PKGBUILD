# Maintainer: Samuel Fernando Mesa <samuelmesa dot linuxmail.org>

pkgname=librasterlite2
pkgver=1.1.0
_pkgver=1.1.0-beta1
pkgrel=1
pkgdesc="librasterlite2 is an open source library that stores and retrieves huge raster coverages using a SpatiaLite DBMS."
url="https://www.gaia-gis.it/fossil/librasterlite2/index"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('libspatialite' 'libpng'  'proj' 'openjpeg2' 'charls1')
provides=("librasterlite2")
conflicts=("librasterlite2")
replaces=("librasterlite2")
replaces=(spatialite_gui)
source=("http://www.gaia-gis.it/gaia-sins/librasterlite2-sources/librasterlite2-${_pkgver}.tar.gz")
sha256sums=('f7284cdfc07ad343a314e4878df0300874b0145d9d331b063b096b482e7e44f4')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  sed -ie 's/(wx-config --libs)/(wx-config --libs all)/g' ./configure.ac
  sed -ie 's/-lgeos_c/-lgeos_c -lsqlite3/' configure.ac

  autoconf
  ./configure --prefix="/usr"
  make
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
