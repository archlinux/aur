# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Matt Johnson <matt9j@cs.washington.edu>
# Contributor: Dominik Heidler <dominik@heidler.eu>
# Contributor: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>

pkgname=libosmocore
pkgver=1.9.2
pkgrel=1
pkgdesc="Osmocom core libraries"
arch=('armv7h' 'i686' 'x86_64')
url="https://osmocom.org/projects/libosmocore/"
license=('GPL')
groups=()
provides=()
depends=('pcsclite' 'talloc' 'libusb' 'lksctp-tools' 'libmnl' 'gnutls' 'systemd-libs' 'liburing')
makedepends=('python')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('2c469e2984bbf730c7efd7c557f833de0fe189dc152004a9a6405b8db917019c')

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

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
