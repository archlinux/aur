# Maintainer: Michael Kogan <michael dot kogan at gmx dot net>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libgnomecanvas
pkgver=2.30.3
pkgrel=4
pkgdesc="The GNOME Canvas library"
arch=(x86_64)
license=('LGPL')
depends=('libglade' 'libart-lgpl')
makedepends=('pkg-config' 'intltool' 'python')
url="http://www.gnome.org"
source=(https://download.gnome.org/sources/${pkgname}/2.30/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('859b78e08489fce4d5c15c676fec1cd79782f115f516e8ad8bed6abcb8dedd40')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static \
      --enable-glade

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
