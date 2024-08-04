# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-mgw
pkgver=1.13.0
pkgrel=1
pkgdesc="Osmocom's Media Gateway for 2G and 3G circuit-switched mobile networks"
url="https://osmocom.org/projects/osmo-mgw/"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later AND AGPL-3.0-or-later')
depends=('libosmocore' 'libosmo-abis' 'libosmo-netif' 'talloc')
provides=('libosmo-mgcp-client.so=14-64')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-mgw.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('860055ee71223fae5ed5f0d338c3f1a31d05e499196279134067cecea735bf0a')

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
