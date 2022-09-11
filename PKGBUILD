# Maintainer: Amish <contact at via dot aur>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=libdaq
pkgver=3.0.9
pkgrel=1
pkgdesc='Data Acquisition library for packet I/O.'
arch=('i686' 'x86_64')
url='https://www.snort.org/'
license=('GPL')
depends=('libpcap' 'libnetfilter_queue')
makedepends=('ca-certificates')
source=("libdaq-${pkgver}.tar.gz::https://github.com/snort3/libdaq/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('da909fb16686de6cb2dcdbfd9f9f9db90ed2b9b627f48b8fbb79a8c3832ecec343edd541e5bb7e6d78402faa291a277587c37a19d4fbda3bff6284bc40e3fafe')
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
