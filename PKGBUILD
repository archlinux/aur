# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: David Rosenstrauch <darose@darose.net>

set -u
pkgname='shp2text'
pkgver=1.7
pkgrel=1
pkgdesc='This utility dumps shapefiles and associated data into various formats'
arch=('x86_64')
#url='http://legacy.obviously.com/gis/shp2text/'
url='https://github.com/Byclosure/shp2text'
license=('LGPL-2.0-or-later')
depends=('glibc')
source=('https://github.com/Byclosure/shp2text/archive/master.zip'
        'shapefil.h')
sha256sums=('3d21deaebee8db4284d4ff1e76bd66689299481eeacbde7d8122565d208ca33a'
            '013e174d4644636ae308f91d34b4ca86a08eab738f86b7540a56dc3c74d54f8c')

prepare() {
  set -u
  cd "${pkgname}-master"
  rm -f 'shapefil.h'
  cp "${srcdir}/shapefil.h" .
  sed -E -e '/^CFLAGS/ s:$: -std=gnu17 -include ctype.h:g' -i 'Makefile'
  set +u
}

build() {
  set -u
  cd "${pkgname}-master"
  make
  set +u
}

package() {
  set -u
  cd "${pkgname}-master"
  install -Dpm755 "${pkgname}" 'shpdiff' -t "${pkgdir}/usr/bin/"
  set +u
}
set +u
