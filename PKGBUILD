#Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=gnome-desktop
pkgname=${_pkgname}2
pkgver=2.32.1
pkgrel=1
pkgdesc="Library with common API for various GNOME modules (legacy version)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk2' 'python2')
makedepends=('gnome-doc-utils' 'intltool')
url="http://www.gnome.org"
options=('!libtool')
source=(https://download.gnome.org/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('55cbecf67efe1fa1e57ac966520a7c46d799c8ba3c652a1219f60cafccb3739d')

build() {
  cd "${_pkgname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --with-gnome-distributor="Arch Linux"
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
