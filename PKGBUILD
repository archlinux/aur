# Maintainer: Cezary Drożak <czarek@drozak.net>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Eduard "bekks" Warkentin <eduard.warkentin@gmail.com>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>

_pkgver=0.9.4
_pkgname=mdbtools
_srcname="${_pkgname}-${_pkgver}"
pkgname=mdbtools
pkgver=${_pkgver//-/_}
pkgrel=2
provides=("mdbtools=$pkgver")
pkgdesc="Utilities for viewing data and exporting schema from Microsoft Access database files"
arch=('i686' 'x86_64')
url="https://github.com/mdbtools/mdbtools"
license=('LGPL' 'GPL')
makedepends=('unixodbc')
depends=('unixodbc' 'glib2')
optdepends=('gmdb2: graphical viewer for MDB files')
source=("${_srcname}.tar.gz::$url/archive/v${_pkgver}.tar.gz")
md5sums=('a848ecd30287499f38bc2f3642c20eed')

prepare() {
  cd "${srcdir}/${_srcname}"
  autoreconf -i -f
}

build() {
  cd "${srcdir}/${_srcname}"
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man \
              --with-unixodbc=/usr
  make
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 ft=sh et
