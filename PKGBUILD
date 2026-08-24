# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-sgsn
pkgver=1.13.2
pkgrel=1
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
sha256sums=('4a772d068a62822f7c762ebfd0afba32e9d87ee2d8e1190c506f5eaa5780a306')

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
