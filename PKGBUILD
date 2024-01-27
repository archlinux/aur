# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-bsc
pkgver=1.11.1
pkgrel=1
pkgdesc="Osmocom's Base Station Controller for 2G circuit-switched mobile networks"
url="https://osmocom.org/projects/osmobsc"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore'
         'libosmo-abis'
         'libosmo-sccp'
         'libosmo-netif'
         'libosmo-mgcp-client.so' # from osmo-mgw
         'sqlite' # for osmo-meas-udp2db
         'libpcap' # for osmo-meas-pcap2db
         # TODO: 'libcdk' for --enable-meas-vis
         'talloc')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-bsc.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('11170f7a11246d4c7147ee8528ed060e54c743442ffbcee279c55261c9f59ad9')

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
