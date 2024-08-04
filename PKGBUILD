# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=libasn1c
pkgver=0.9.37
pkgrel=1
pkgdesc="runtime library of Lev Walkin's asn1c split out as separate library"
url="https://cgit.osmocom.org/libasn1c"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('BSD-2-Clause')
depends=('talloc')
provides=('libasn1c.so=1-64')
conflicts=("${pkgname}-git")
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('1be05dc2afcc539ec5b7d1828058ff05ab58841bfab6f97682deedcf5b29bf5e')

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
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
