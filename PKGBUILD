# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-bts
pkgver=1.9.0
pkgrel=1
pkgdesc="Osmocom's GSM BTS (Base Transceiver Station) with A-bis/IP interface"
url="https://osmocom.org/projects/osmobts"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later AND AGPL-3.0-or-later')
depends=('libosmocore' 'libosmo-abis' 'libosmo-netif' 'talloc' 'ortp')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-bts-trx.cfg'
        'etc/osmocom/osmo-bts-virtual.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('3ade52889172bc9ce941d9661f2639703f1d1e06442ef3ef5b7c3ae8976e4e76')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --enable-trx
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
