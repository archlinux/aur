# Maintainer: Echo J. <aidas957 at gmail dot com>

# shellcheck shell=bash disable=SC2034,SC2164
# vim:set ts=3 sw=3 et:

pkgname=dumpvdl2
pkgver=2.7.0
pkgrel=1
pkgdesc="VDL Mode 2 message decoder and protocol analyzer"
arch=('x86_64')
url="https://github.com/szpajder/dumpvdl2"
license=('GPL-3.0-only')
depends=('glib2' 'libacars' 'protobuf-c' 'rtl-sdr' 'soapysdr' 'sqlite' 'zeromq')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ac29399c77c00c02249e32f75b0c171c8755a409adbc9166786cefdb7e80d9733af7cec9436ebbc27750c452fb3ae786811910dab8879fad62032f8afd1ee42a')

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
