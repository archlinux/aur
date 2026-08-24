# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-msc
pkgver=1.16.0
pkgrel=1
pkgdesc="Osmocom's Mobile Switching Center for 2G and 3G circuit-switched mobile networks"
url="https://osmocom.org/projects/osmomsc"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('AGPL-3.0-or-later AND GPL-2.0-or-later')
depends=('libosmocore>=1.14.2'
         'libosmo-abis>=2.2.0'
         'libosmo-netif>=1.8.0'
         'libosmo-sigtran>=2.3.0'
         'libosmo-gsup-client.so' # from osmo-hlr>=1.9.0
         'libosmo-mgcp-client.so' # from osmo-mgw>=1.16.0
         'libosmo-ranap.so' # from osmo-iuh>=1.8.1 (for --enable-iu)
         'libasn1c.so' # (for --enable-iu)
         'libsmpp34.so' # (for --enable-smpp)
         'lksctp-tools'
         'sqlite'
         'talloc')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-msc.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('05d0db5ebd06c73c1c5ac18b9206ec9d56b6946d5418db19c39e51c4ac4c9883')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --enable-iu \
              --enable-smpp
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
