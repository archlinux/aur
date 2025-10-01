# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
pkgname=libosmo-asn1-tcap-git
pkgver=r23.a92fd1a
pkgrel=1
pkgdesc="Utility library for ASN.1 of TCAP (SS7)"
arch=('x86_64' 'i686')
url="https://gitea.osmocom.org/ss7-in-c/libosmo-asn1-tcap"
#license=('XXX')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}"
          'libosmo-asn1-tcap.so=0-64')
source=("git+https://gitea.osmocom.org/ss7-in-c/libosmo-asn1-tcap")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  autoreconf -i
  ./configure --prefix=/usr \
              --libdir=/usr/lib/
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
