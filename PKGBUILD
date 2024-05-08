# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-trx
pkgver=1.6.2
pkgrel=1
pkgdesc="GSM Radio Modem based on a fork of the OpenBTS Transceiver program"
url="https://osmocom.org/projects/osmotrx"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('AGPL-3.0-only')
depends=('libosmocore'
         'libusb'
         'libuhd' # --with-uhd
         'limesuite' # --with-lms
         'talloc'
         'fftw')
makedepends=('boost')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-trx-uhd.cfg'
        'etc/osmocom/osmo-trx-lms.cfg'
        'etc/osmocom/osmo-trx-ipc.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('2103d68d98c18899adc54df12b442fb85ffb1d7f628bff2f46114eb9b44cb417')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --with-uhd \
              --with-lms \
              --with-ipc
              # --enable-mstrx
              # --with-bladerf
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
