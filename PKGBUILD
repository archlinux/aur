# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-sgsn
pkgver=1.11.1
pkgrel=1
pkgdesc="Osmocom's Serving GPRS Support Node for 2G and 3G packet-switched mobile networks"
url="https://osmocom.org/projects/osmosgsn"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore'
         'libosmoabis.so' # from libosmo-abis
         'libosmonetif.so' # from libosmo-netif
         'libosmo-sigtran.so' # from libosmo-sccp
         'libosmo-gsup-client.so' # from osmo-hlr
         'libosmo-ranap.so' # from osmo-iuh
         'libasn1c.so' # from libasn1c
         'libgtp.so' # from osmo-ggsn
         'talloc'
         'c-ares')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-sgsn.cfg'
        'etc/osmocom/osmo-gtphub.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('af0ecf64eeabc43aa17c6f7ce4e4676e48b0cdaea7bcac42f2030fce26cd901b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --enable-iu
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
