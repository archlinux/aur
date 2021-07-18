# Maintainer: Samuel Mesa <samuelmesa dot gmail.com>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Brian Galey <bkgaley at gmail dot com>
# Contributor: Pietro Zambelli <peter.zamb at gmail dot com>

pkgname=libfreexl-devel
_pkgname=libfreexl
pkgver=r52.2a0759e
pkgrel=1
pkgdesc="FreeXL is an open source library to extract valid data from within Spreadsheets. The following document formats are supported starting since version 2.0"
arch=('x86_64')
url="https://www.gaia-gis.it/fossil/freexl"
license=('MPL' 'GPL' 'LGPL')
depends=('glibc')
makedepends=('fossil')
conflicts=('libfreexl')
provides=('libfreexl')
replaces=('libfreexl')

prepare() {
  mkdir -p $_pkgname
  cd $_pkgname

  fossil clone https://www.gaia-gis.it/fossil/freexl freexl.fossil
  fossil open -f freexl.fossil
}

pkgver() {
  cd $_pkgname

  _hash=$(fossil info | sed -n 's/checkout: *\([0-9a-z]*\).*/\1/p' | cut -c 1-7)
  _revision=$(fossil info | sed -n 's/check-ins: *\(.*\)/\1/p')
  printf "r%s.%s" "$_revision" "$_hash"
}


build() {
  cd $_pkgname

  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname

  make DESTDIR="${pkgdir}" install
}
