# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-msc
pkgver=1.11.1
pkgrel=1
pkgdesc="Osmocom's Mobile Switching Center for 2G and 3G circuit-switched mobile networks"
url="https://osmocom.org/projects/osmomsc"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore'
         'libosmo-abis'
         'libosmo-netif'
         'libosmo-sccp'
         'libosmo-gsup-client.so' # from osmo-hlr
         'libosmo-mgcp-client.so' # from osmo-mgw
         'libosmo-ranap.so' # from osmo-iuh (for --enable-iu)
         'libasn1c' # (for --enable-iu)
         'libsmpp34'
         'lksctp-tools'
         'sqlite'
         'talloc')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-msc.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('bfd055c6ea9623745938a63300fb34269e8709cece09b1cdf2e7e6e3d2e75cb1')

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
