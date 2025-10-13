# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-abis
pkgver=2.0.1
pkgrel=3
pkgdesc="Osmocom library for A-bis interface"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://osmocom.org/projects/libosmo-abis"
license=('GPL-2.0-or-later AND LGPL-2.1-only AND AGPL-3.0-or-later')
depends=('libosmocore' # TODO: libosmocore>=1.9.0
         'libosmo-netif'
         'ortp')
provides=("libosmoabis.so=15-64"
          "libosmotrau.so=11-64")
conflicts=("${pkgname}-git")
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('549f25aa9b7d8f5db394bbf1a999fcb0f91e36bfd252603e97054657437ca1c0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --disable-dahdi
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
