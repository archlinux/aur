# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-mgw
pkgver=1.16.1
pkgrel=1
pkgdesc="Osmocom's Media Gateway for 2G and 3G circuit-switched mobile networks"
url="https://osmocom.org/projects/osmo-mgw/"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later AND AGPL-3.0-or-later')
depends=('libosmocore>=1.14.2'
         'libosmo-abis>=2.2.0'
         'libosmo-netif>=1.8.0'
         'talloc')
provides=('libosmo-mgcp-client.so=16-64')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-mgw.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('7a4d1f4eb3521f955ec99bedf8f615d3bc37253a24d891f0305a482f74ec244c')

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
