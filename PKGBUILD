# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-pcu
pkgver=1.5.0
pkgrel=1
pkgdesc="Osmocom's GPRS/EGPRS PCU (Packet Control Unit) with Gb/IP interface"
url="https://osmocom.org/projects/osmopcu"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later AND AGPL-3.0-or-later')
depends=('libosmocore' 'talloc')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-pcu.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('2bc41e93fef9b8850744cf41fb575b6437fb8445f74138d15f4e97764b5d4cad')

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
