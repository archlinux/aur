# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-iuh
pkgver=1.8.0
pkgrel=1
pkgdesc="Osmocom code for the Iuh interface (HNBAP, RUA, RANAP)"
url="http://osmocom.org/projects/osmohnbgw"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('AGPL-3.0-or-later')
depends=('libosmocore'
         'libosmo-netif'
         'libosmo-sigtran'
         'libasn1c'
         'lksctp-tools'
         'talloc')
makedepends=('python')
provides=('libosmo-hnbap.so=0-64'
          'libosmo-ranap.so=7-64'
          'libosmo-rua.so=0-64'
          'libosmo-sabp.so=1-64')
conflicts=("${pkgname}-git")
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('996d4b7aab89785356e5949e4789ac474083fe370739fe34fb1b6c536527a8fd')

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
