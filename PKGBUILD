# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=osmo-upf-git
pkgver=0.1.1.r103.g3efa019
pkgrel=1
pkgdesc="Osmocom implementation of the 3GPP UPF (User Plane Function)"
url="https://osmocom.org/projects/osmo-upf"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('libosmocore-git'
         'libosmo-pfcp-git'
         'libgtpnl-git'
         'nftables'
         'talloc')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-upf.cfg')
source=("git+https://gitea.osmocom.org/cellular-infrastructure/${pkgname%-git}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  autoreconf -f -i
}

build() {
  cd "${pkgname%-git}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
