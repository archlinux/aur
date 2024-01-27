# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-iuh
pkgver=1.5.1
pkgrel=2
pkgdesc="Osmocom code for the Iuh interface (HNBAP, RUA, RANAP)"
url="http://osmocom.org/projects/osmohnbgw"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'libosmo-netif' 'libosmo-sccp' 'talloc' 'libasn1c' 'lksctp-tools')
makedepends=('python')
provides=('libosmo-hnbap.so=0-64'
          'libosmo-ranap.so=7-64'
          'libosmo-rua.so=0-64'
          'libosmo-sabp.so=1-64')
conflicts=("${pkgname}-git")
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('b142cec184d92410fa0e79631923a5349f68453315c7f799e3b486bb8228dd1a')

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
