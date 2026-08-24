# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-bts
pkgver=1.12.0
pkgrel=1
pkgdesc="Osmocom's GSM BTS (Base Transceiver Station) with A-bis/IP interface"
url="https://osmocom.org/projects/osmobts"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later AND AGPL-3.0-or-later')
depends=('libosmocore>=1.14.2'
         'libosmo-abis>=2.2.0'
         'libosmo-netif>=1.8.0'
         'talloc'
         'ortp')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-bts-trx.cfg'
        'etc/osmocom/osmo-bts-virtual.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('31f5ae121e59a8de594b86c990659b3791127789ed5e9c6f27565bbd16227167')

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
