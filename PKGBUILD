# Maintainer: Amish <contact at via dot aur>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=libdaq
pkgver=3.0.28
pkgrel=1
pkgdesc='Data Acquisition library for packet I/O.'
arch=('x86_64')
url='https://www.snort.org/'
license=('GPL-2.0-only')
depends=('libpcap' 'libnetfilter_queue')
makedepends=('ca-certificates')
source=("libdaq-${pkgver}.tar.gz::https://github.com/snort3/libdaq/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('7dc8a825a861018cd60ef8d183ef445aa30ed2dfcfcb69a4d451dbeeb4d9286302f19888fbbfa6c9bcb4298a0899823ac9f0ed416213a12e4c704fda1c61632e')
provides=('libdaq-nfqueue')
conflicts=('libdaq-nfqueue')
replaces=('libdaq-nfqueue')

build() {
  cd "${srcdir}/libdaq-${pkgver}"
  ./bootstrap
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make V=0
}

package() {
  cd "${srcdir}/libdaq-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
