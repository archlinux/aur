# Maintainer: Luke Shumaker <lukeshu@sbcglobal.net>
# Maintainer (AUR): Miguel Revilla <yo@miguelrevilla.com>
# Contributor (AUR): TDY <tdy@gmx.com>
# Contributor (AUR): Eduard "bekks" Warkentin <eduard.warkentin@gmail.com>
# Contributor (AUR): Cezary Drożak <czarek@drozak.net>

pkgname=mdbtools-beta
provides=(mdbtools)
conflicts=(mdbtools)
_pkgver=1.0.0-beta1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utilities for viewing data and exporting schema from Microsoft Access database files"
arch=('i686' 'x86_64')
url="https://github.com/mdbtools/mdbtools"
license=('LGPL' 'GPL')
makedepends=('txt2man' 'unixodbc')
depends=('unixodbc')
optdepends=('gmdb2: graphical viewer for MDB files')
# options=('!libtool' '!emptydirs')
source=($pkgname-${_pkgver}.tar.gz::$url/archive/v${_pkgver}.tar.gz)

md5sums=('47b39818b1f8042351c93cb3e45e0d0d')

prepare() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  # for patch in ../*.patch; do
  #   patch -Np1 -i "$patch"
  # done
  autoreconf -i -f
}

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man \
              --with-unixodbc=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 ft=sh et
