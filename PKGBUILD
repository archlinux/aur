# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=osmo-uecups
pkgver=0.4.0
pkgrel=1
pkgdesc="Osmocom UE simulation control/user plane separation"
url="https://osmocom.org/projects/osmo-uecups/wiki"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
depends=('jansson'
         'libnl'
         'lksctp-tools'
         'libosmocore>=1.14.2'
         'libosmo-netif>=1.8.0')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-uecups-daemon.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('672faf64882573b168a0989ff64762d1528160f28180022ce99c8b580cd69e42')

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
