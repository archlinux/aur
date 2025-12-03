# Maintainer: Amish <contact at via dot aur>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=libdaq
pkgver=3.0.23
pkgrel=1
pkgdesc='Data Acquisition library for packet I/O.'
arch=('x86_64')
url='https://www.snort.org/'
license=('GPL-2.0-only')
depends=('libpcap' 'libnetfilter_queue')
makedepends=('ca-certificates')
source=("libdaq-${pkgver}.tar.gz::https://github.com/snort3/libdaq/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('404c1a1e6169bb9134f978a80569bd749da9102dd32b9646c660815c940b32101cc3a8f89fb5b4ed1cb7c20d0605c35310af0156c01bbe4ffca41c523ba094ab')
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
