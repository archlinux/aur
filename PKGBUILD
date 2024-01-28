# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-pcu
pkgver=1.4.0
pkgrel=1
pkgdesc="Osmocom's GPRS/EGPRS PCU (Packet Control Unit) with Gb/IP interface"
url="https://osmocom.org/projects/osmopcu"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'talloc')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-pcu.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('d4e539ef15f2722cad3382da6b0b1e8ab69909011c8bac9489189e7cace94555')

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
