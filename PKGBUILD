# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-hlr
pkgver=1.9.4
pkgrel=1
pkgdesc="Osmocom HLR for GSUP protocol towards OsmoSGSN and OsmoCSCN"
url="https://osmocom.org/projects/osmo-hlr"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('AGPL-3.0-or-later')
depends=('libosmocore>=1.11.0'
         'libosmo-abis>=2.0.0'
         'talloc'
         'sqlite')
provides=('libosmo-gsup-client.so=0-64'
          'libosmo-mslookup.so=1-64')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-hlr.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('8cc4e97da4f8ae758f1790361331efd88535bee85a3ce2542900fd5e64507b83')

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
}

# vim:set ts=2 sw=2 et:
