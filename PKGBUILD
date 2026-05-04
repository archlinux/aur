# Maintainer: Amish <contact at via dot aur>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=libdaq
pkgver=3.0.27
pkgrel=1
pkgdesc='Data Acquisition library for packet I/O.'
arch=('x86_64')
url='https://www.snort.org/'
license=('GPL-2.0-only')
depends=('libpcap' 'libnetfilter_queue')
makedepends=('ca-certificates')
source=("libdaq-${pkgver}.tar.gz::https://github.com/snort3/libdaq/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('5ff50341f94d72232418ae8e8297f29f3480bbc846ba000c010192b448674da6251c69bb979d403424f63990d36ddc921b584159451633243eea0ee47b93d666')
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
