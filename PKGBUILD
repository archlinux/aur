# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-sigtran
pkgver=2.3.0
pkgrel=1
pkgdesc="Osmocom SIGTRAN (SCCP/SUA/M3UA) library as well as OsmoSTP"
arch=('any')
url="https://osmocom.org/projects/libosmo-sccp"
license=('GPL-2.0-or-later')
depends=('libosmocore>=1.14.2'
         'libosmo-netif>=1.8.0')
provides=("libosmo-sigtran.so=12-64")
conflicts=("${pkgname}-git"
           'libosmo-sccp-git'
           'libosmo-sccp')
replaces=('libosmo-sccp')
backup=('etc/osmocom/osmo-stp.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('493244bdf4a4ea821d58bbc881ccd01c1539618cb003826765357ce0c4643470')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
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
