# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=libdaq-static
_pkgname=libdaq
pkgver=3.0.5
pkgrel=1
pkgdesc='Data Acquisition library for packet I/O.'
arch=('i686' 'x86_64')
url='https://www.snort.org/'
license=('GPL')
depends=('libpcap' 'libnetfilter_queue')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
options=('staticlibs')
makedepends=('ca-certificates')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/snort3/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8eaf6f47bba64e9482bea0189ed342b744df17974b6ee0e8ab19a244ef2a9c995aec6ef077a8bc131a5bad61a363b5a01b7477ae31b3bce17188dd0771533649')

build() {
  cd ${_pkgname}-${pkgver}
  ./bootstrap
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make V=0
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
