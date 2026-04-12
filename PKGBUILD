# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-abis
pkgver=2.1.0
pkgrel=1
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
sha256sums=('e35fb101ee4addd5304c93cd92594f4af410f844dca72af2d1a6314f6c94f467')

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
