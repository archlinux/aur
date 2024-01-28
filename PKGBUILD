# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-trx
pkgver=1.6.1
pkgrel=1
pkgdesc="GSM Radio Modem based on a fork of the OpenBTS Transceiver program"
url="https://osmocom.org/projects/osmotrx"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
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
sha256sums=('a5ac6a301c2225d75fade2611c5fa4621a8c79324034151569c219c6b3e0dacd')

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
