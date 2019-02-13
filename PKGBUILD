# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-trx-git
pkgver=1.0.0.5.g158ea5b
pkgrel=1
pkgdesc="GSM Radio Modem based on a fork of the OpenBTS Transceiver program"
url="https://osmocom.org/projects/osmotrx"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'talloc' 'libusb' 'fftw' 'libuhd' 'limesuite')
makedepends=('git' 'boost')
optdepends=('gnuradio: legacy support for USRP1')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-trx-lms.cfg' 'etc/osmocom/osmo-trx-uhd.cfg')
source=("git+https://git.osmocom.org/${pkgname%-git}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  autoreconf -i
  ./configure --prefix=/usr --sysconfdir=/etc --with-uhd --with-lms
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
