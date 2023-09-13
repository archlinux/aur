# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-sccp
pkgver=1.8.0
pkgrel=1
pkgdesc="Osmocom library for SCCP"
arch=('any')
url="https://osmocom.org/projects/libosmo-sccp"
license=(GPL)
# TODO: libosmocore>=1.9.0 libosmo-netif>=1.4.0
depends=('libosmocore' 'libosmo-netif')
provides=("libosmo-sigtran.so=${pkgver}")
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-stp.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('76fe65e24cd1143e1aaf048a9c3f31112be746cc7dc01dad9e42e2de078c854d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
