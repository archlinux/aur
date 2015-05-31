# Maintainer: Robert Knauer <robert@privatdemail.net>

pkgname=lua51-dbi
_pkgname=luadbi
pkgver=0.5.8d7ad667f956
pkgrel=1
pkgdesc="Database interface library for Lua (5.1)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/luadbi/"
license=('MIT')
makedepends=('sqlite3' 'libmariadbclient' 'postgresql-libs')
depends=('lua51')
optdepends=('sqlite3: sqlite3 Support'
            'postgresql-libs: postgresql Support'
            'libmariadbclient: mysql Support')
source=("${_pkgname}.${pkgver}.tar.gz::https://luadbi.googlecode.com/archive/8d7ad667f956a52235295e62176703cae1a7dedc.zip"
        'mycommit.patch')
sha1sums=('SKIP'
          'd92128ab05ecb86dae7e95161f36b8bf0d3cf2fc')

prepare() {
  rm -fr build
  cp -R "${_pkgname}-8d7ad667f956" build

  cd build
  patch -p1 -i ../mycommit.patch

  sed 's|#!/usr/bin/lua|#!/usr/bin/lua5.1|g' -i DBI.lua
}

build() {
  cd build
  make free
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install_free
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

