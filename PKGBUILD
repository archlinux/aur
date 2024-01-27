# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-ggsn
pkgver=1.9.1
pkgrel=1
pkgdesc="Open Source implementation of a GGSN (Gateway GPRS Support Node)"
url="https://osmocom.org/projects/openggsn"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'talloc')
provides=('libgtp.so=6-64')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-ggsn.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('4629580df8abc01c392e443c7a2945b3ab3d34e9bcce27a73405a2ad1797a294')

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
