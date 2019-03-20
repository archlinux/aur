# Maintainer:  Alex Mekkering <amekkering at gmail dot com>

pkgname=whsniff
pkgver=1.1
pkgrel=1
pkgdesc="A command line utility that interfaces TI CC2531 USB dongle with Wireshark for capturing and displaying IEEE 802.15.4 traffic at 2.4 GHz."
arch=('x86_64')
url='https://github.com/homewsn/whsniff'
license=('GPL')
depends=('libusb')
makedepends=('sed')
source=( "https://github.com/homewsn/whsniff/archive/v${pkgver}.tar.gz" )
sha256sums=('5d8be9dbdb572e0d05c33e8cb613ebdb31e939a032e350aff4151e83def8ad2e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # patch sources
  sed -i "s:PREFIX = /usr/local:PREFIX = ${pkgdir}:g" Makefile
  sed -i 's:libusb_set_debug(NULL:libusb_set_option(NULL, LIBUSB_OPTION_LOG_LEVEL:g' src/whsniff.c
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install
}
