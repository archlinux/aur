# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-pcu-git
pkgver=1.5.0.r4.g8734f176
pkgrel=1
pkgdesc="Osmocom's GPRS/EGPRS PCU (Packet Control Unit) with Gb/IP interface"
url="https://osmocom.org/projects/osmopcu"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later AND AGPL-3.0-or-later')
depends=('libosmocore-git' 'talloc')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
backup=('etc/osmocom/osmo-pcu.cfg')
source=("git+https://gitea.osmocom.org/cellular-infrastructure/${pkgname%-git}.git")
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
