# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Matt Johnson <matt9j@cs.washington.edu>
# Contributor: Dominik Heidler <dominik@heidler.eu>
# Contributor: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>

pkgname=libosmocore
pkgver=1.10.0
pkgrel=2
pkgdesc="Osmocom core libraries"
arch=('armv7h' 'i686' 'x86_64')
url="https://osmocom.org/projects/libosmocore/"
license=('GPL-2.0-or-later')
groups=()
conflicts=("${pkgname}-git")
provides=('libosmocodec.so=4-64'
          'libosmocoding.so=0-64'
          'libosmocore.so=22-64'
          'libosmoctrl.so=0-64'
          'libosmogb.so=14-64'
          'libosmogsm.so=20-64'
          'libosmoisdn.so=0-64'
          'libosmosim.so=2-64'
          'libosmousb.so=0-64'
          'libosmovty.so=13-64')
depends=('pcsclite' 'talloc' 'libusb' 'lksctp-tools' 'libmnl' 'gnutls' 'systemd-libs' 'liburing')
makedepends=('python')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('09fcbd8a49a69ace726338c561cb536acb09b9e8a3777b17b11202802e008548')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --exec-prefix=/usr \
              --bindir=/usr/bin \
              --sbindir=/usr/bin \
              --datadir=/usr/share \
              --libexecdir=/usr/lib \
              --localstatedir=/var \
              --docdir=/usr/share/doc/libosmocore \
              --libdir=/usr/lib/ \
              --enable-systemd-logging
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
