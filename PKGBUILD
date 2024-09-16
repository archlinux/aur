# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-iuh
pkgver=1.6.0
pkgrel=2
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
sha256sums=('800a8583e4ff869d6d82a48448031c57576a0f29c667d513fe2ed769710f2f8e')

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
