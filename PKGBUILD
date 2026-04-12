# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=osmo-upf
pkgver=0.4.0
pkgrel=1
pkgdesc="Osmocom implementation of the 3GPP UPF (User Plane Function)"
url="https://osmocom.org/projects/osmo-upf"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('libosmocore'
         'libosmo-pfcp'
         'libgtpnl'
         'nftables'
         'talloc')
conflicts=("${pkgname%}-git")
backup=('etc/osmocom/osmo-upf.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('122ff0be5747718a469b13734a3b4bc1f6e2ebae527e2b0ed03f79954572d273')

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
