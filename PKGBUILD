# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-pcu
pkgver=1.5.2
pkgrel=1
pkgdesc="Osmocom's GPRS/EGPRS PCU (Packet Control Unit) with Gb/IP interface"
url="https://osmocom.org/projects/osmopcu"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later AND AGPL-3.0-or-later')
depends=('libosmocore' 'talloc')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-pcu.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('d8ee0669bb3c9a7c323c5d8405807a12ee78a2a5dbc42f912d5b2664e8d32dc7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
