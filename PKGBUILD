# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-sip-connector
pkgver=1.7.0
pkgrel=1
pkgdesc="Gateway between the MNCC Interface of OsmoMSC and OsmoNITB and an external SIP trunk"
url="https://osmocom.org/projects/osmo-sip-conector"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('AGPL-3.0-or-later')
depends=('libosmocore' 'talloc' 'sofia-sip')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-sip-connector.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('f4df6edb265c23bf255e68ea882a074ee2cc882fdfaa2d07a6fd4f4e6e4a42a4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
