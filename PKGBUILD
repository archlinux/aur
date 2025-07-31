# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=osmo-uecups
pkgver=0.2.2
pkgrel=1
pkgdesc="Osmocom UE simulation control/user plane separation"
url="https://osmocom.org/projects/osmo-uecups/wiki"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
depends=('jansson'
         'libnl'
         'lksctp-tools'
         'libosmocore'
         'libosmo-netif')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-uecups-daemon.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('72e256d4eb6757f2aee90049dbe4dd5484dbf76c89e0586a4b657769d3a90629')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --bindir=/usr/bin
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
