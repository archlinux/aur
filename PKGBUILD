# Maintainer: Echo J. <aidas957 at gmail dot com>

# shellcheck shell=bash disable=SC2034,SC2164
# vim:set ts=3 sw=3 et:

pkgname=dumpvdl2
pkgver=2.6.0
pkgrel=1
pkgdesc="VDL Mode 2 message decoder and protocol analyzer"
arch=('x86_64')
url="https://github.com/szpajder/dumpvdl2"
license=('GPL-3.0-only')
depends=('glib2' 'libacars' 'protobuf-c' 'rtl-sdr' 'soapysdr' 'sqlite' 'zeromq')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('2133c26a08247cf21a5cbf1f2b8c43985765e1048675db8eaf021c1edcb1f00d2cf896ac1f3f51fb6f665133b40564f3131fb30baf3ee7ae57310614fb52e88e')

build() {
   cmake -S "${pkgname}-${pkgver}" -B build \
      -DCMAKE_BUILD_TYPE=None \
      -DMIRISDR=OFF \
      -DSDRPLAY=OFF \
      -DSDRPLAY3=OFF \
      -DETSY_STATSD=OFF \
      -DPROFILING=OFF
   cmake --build build
}

package() {
   DESTDIR="${pkgdir}" cmake --install build --prefix /usr
}
