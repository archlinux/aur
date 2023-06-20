# Maintainer: Amish <contact at via dot aur>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=libdaq
pkgver=3.0.12
pkgrel=1
pkgdesc='Data Acquisition library for packet I/O.'
arch=('i686' 'x86_64')
url='https://www.snort.org/'
license=('GPL')
depends=('libpcap' 'libnetfilter_queue')
makedepends=('ca-certificates')
source=("libdaq-${pkgver}.tar.gz::https://github.com/snort3/libdaq/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('e2699bd97045d195e9c3187beaa56da53f907751ed87e6dfd7b90bbc138f8dc21d2b3fe1aae731ee198e01e0d124dab9e52291ad909ed65147277ae82b62b58a')
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
