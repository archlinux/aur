# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=libosmo-gprs
pkgver=0.2.0
pkgrel=1
pkgdesc="Osmocom GPRS libraries"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/libosmo-gprs"
license=('GPL-2.0-or-later AND AGPL-3.0-or-later')
depends=('libosmocore')
conflicts=("${pkgname}-git")
provides=('libosmo-csn1.so=1-64'
          'libosmo-gprs-gmm.so=1-64'
          'libosmo-gprs-llc.so=1-64'
          'libosmo-gprs-rlcmac.so=1-64'
          'libosmo-gprs-sm.so=1-64'
          'libosmo-gprs-sndcp.so=1-64')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('b979c40ee8000b9a5eafa071013d3ee90372a6b43adac1a7afc5cf67f1ee8636')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # FIXME: LTO breaks unit tests (-Wl,-wrap)
  # https://osmocom.org/issues/4123
  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88643
  #make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
