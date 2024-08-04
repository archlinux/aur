# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=libosmo-pfcp
pkgver=0.4.0
pkgrel=1
pkgdesc="PFCP protocol encoding and decoding, and generic PFCP endpoint implementation"
arch=('any')
url="https://osmocom.org/projects/libosmo-pfcp"
license=('GPL-2.0-or-later')
depends=('libosmocore') # TODO: >=1.9.0
provides=("libosmo-gtlv.so=1-64"
          "libosmo-pfcp.so=0-64")
conflicts=("${pkgname}-git")
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('5f4149911861a7fe160d2f352df82a313539eebe8bfc487560b8f68ed8219a06')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
