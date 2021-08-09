# Maintainer: Luke Shumaker <lukeshu@sbcglobal.net>
# Maintainer (AUR): Miguel Revilla <yo@miguelrevilla.com>
# Contributor (AUR): TDY <tdy@gmx.com>
# Contributor (AUR): Eduard "bekks" Warkentin <eduard.warkentin@gmail.com>
# Contributor (AUR): Cezary Drożak <czarek@drozak.net>

_pkgver=1.0.0-beta1
_pkgname=mdbtools
_srcname="${_pkgname}-${_pkgver}"
pkgname=mdbtools-beta
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Utilities for viewing data and exporting schema from Microsoft Access database files"
arch=('i686' 'x86_64')
url="https://github.com/mdbtools/mdbtools"
license=('LGPL' 'GPL')
makedepends=('txt2man' 'unixodbc')
depends=('unixodbc')
optdepends=('gmdb2: graphical viewer for MDB files')
source=("${_srcname}.tar.gz::$url/archive/v${_pkgver}.tar.gz")

md5sums=('47b39818b1f8042351c93cb3e45e0d0d')

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
