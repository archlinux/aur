# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=libosmo-sccp
pkgver=1.9.0
pkgrel=2
pkgdesc="Osmocom library for SCCP (DEPRECATED)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://osmocom.org/projects/libosmo-sccp"
license=('GPL-2.0-or-later')
# TODO: libosmocore>=1.9.0 libosmo-netif>=1.4.0
depends=('libosmocore' 'libosmo-netif')
provides=("libosmo-sigtran.so=10-64")
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-stp.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('b6c219e57c79bda9eb0edb7eae64ba01b952126ecb48b6a6667e4fce21f977a9')

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
