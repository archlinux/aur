# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
pkgname=libosmo-asn1-tcap-git
pkgver=0.2.1.r5.d888f1b
pkgrel=1
pkgdesc="Utility library for ASN.1 of TCAP (SS7)"
arch=('x86_64' 'i686')
url="https://gitea.osmocom.org/ss7-in-c/libosmo-asn1-tcap"
license=('GPL-2.0-or-later')
makedepends=('git')
depends=('talloc')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}"
          'libosmo-asn1-tcap.so=1-64')
source=("git+https://gitea.osmocom.org/ss7-in-c/libosmo-asn1-tcap")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  autoreconf -i
  ./configure --prefix=/usr \
              --libdir=/usr/lib/
  make
}

check() {
  cd "$srcdir/${pkgname%-git}"
  make check
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
