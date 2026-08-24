# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-sgsn
pkgver=1.13.1
pkgrel=2
pkgdesc="Osmocom's Serving GPRS Support Node for 2G and 3G packet-switched mobile networks"
url="https://osmocom.org/projects/osmosgsn"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('AGPL-3.0-or-later')
depends=('libosmocore>=1.11.0'
         'libosmo-sigtran>=2.1.0'
         'libosmo-gsup-client.so' # from osmo-hlr
         'libosmo-ranap.so' # from osmo-iuh
         'libasn1c.so' # from libasn1c
         'libgtp.so' # from osmo-ggsn
         'talloc'
         'c-ares')
makedepends=('libosmo-abis')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-sgsn.cfg'
        'etc/osmocom/osmo-gtphub.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('730bc88b3650e3444f3827e81fc51a7b2fa4cd6da27f6101070d6aa4238b656b')

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
