# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-sigtran
pkgver=2.0.0
pkgrel=1
pkgdesc="Osmocom SIGTRAN (SCCP/SUA/M3UA) library as well as OsmoSTP"
arch=('any')
url="https://osmocom.org/projects/libosmo-sccp"
license=('GPL-2.0-or-later')
depends=('libosmocore>=1.10.0'
         'libosmo-netif>=1.5.0')
provides=("libosmo-sigtran.so=10-64")
conflicts=("${pkgname}-git"
           'libosmo-sccp-git'
           'libosmo-sccp')
replaces=('libosmo-sccp')
backup=('etc/osmocom/osmo-stp.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('37b6f5ba9edbaf0e846d512ce80375b874a21bad1f707a5efcad5598b2659912')

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
