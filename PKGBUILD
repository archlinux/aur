# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-ggsn
pkgver=1.13.0
pkgrel=1
pkgdesc="Open Source implementation of a GGSN (Gateway GPRS Support Node)"
url="https://osmocom.org/projects/openggsn"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-only AND LGPL-2.1-or-later AND MIT')
depends=('libosmocore' 'talloc')
provides=('libgtp.so=10-64')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-ggsn.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        'LICENSE-MIT')
sha256sums=('befb5a96b099032a3a77f61422a281286587e67fe36b933921a8daf6386e089a'
            '323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install

  # /usr/bin/gtp-echo-responder is licensed under the MIT
  install -Dm644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

# vim:set ts=2 sw=2 et:
