# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-bsc
pkgver=1.14.1
pkgrel=1
pkgdesc="Osmocom's Base Station Controller for 2G circuit-switched mobile networks"
url="https://osmocom.org/projects/osmobsc"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-3.0-or-later AND LGPL-2.1-only AND AGPL-3.0-or-later')
depends=('libosmocore'
         'libosmo-abis'
         'libosmo-netif'
         'libosmo-sigtran'
         'libosmo-mgcp-client.so' # from osmo-mgw
         'sqlite' # for osmo-meas-udp2db
         'libpcap' # for osmo-meas-pcap2db
         # TODO: 'libcdk' for --enable-meas-vis
         'talloc')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-bsc.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('b238c1ed63d715e853c47b6fc068ca5c78a4e3d5d2556b094b46ead6d2c596b2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --enable-meas-udp2db \
              --enable-meas-pcap2db
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
