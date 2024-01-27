# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-bts
pkgver=1.7.2
pkgrel=1
pkgdesc="Osmocom's GSM BTS (Base Transceiver Station) with A-bis/IP interface"
url="https://osmocom.org/projects/osmobts"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'libosmo-abis' 'libosmo-netif' 'talloc' 'ortp')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-bts-trx.cfg'
        'etc/osmocom/osmo-bts-virtual.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('705b5b363aeaffe8cb844fa87242194795cb3747832e01e34355042e21870d5a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --enable-trx
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
