# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-msc
pkgver=1.14.0
pkgrel=1
pkgdesc="Osmocom's Mobile Switching Center for 2G and 3G circuit-switched mobile networks"
url="https://osmocom.org/projects/osmomsc"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('AGPL-3.0-or-later AND GPL-2.0-or-later')
depends=('libosmocore'
         'libosmo-abis'
         'libosmo-netif'
         'libosmo-sigtran'
         'libosmo-gsup-client.so' # from osmo-hlr
         'libosmo-mgcp-client.so' # from osmo-mgw
         'libosmo-ranap.so' # from osmo-iuh (for --enable-iu)
         'libasn1c.so' # (for --enable-iu)
         'libsmpp34.so' # (for --enable-smpp)
         'lksctp-tools'
         'sqlite'
         'talloc')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-msc.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('552582a1eba58087eb51eead7c5f81d360fdc21d984384400bfc9142fe8c26f0')

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
