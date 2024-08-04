# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-sip-connector-git
pkgver=1.7.0.r0.g7a3532e
pkgrel=1
pkgdesc="Gateway between the MNCC Interface of OsmoMSC and OsmoNITB and an external SIP trunk"
url="https://osmocom.org/projects/osmo-sip-conector"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('AGPL-3.0-or-later')
depends=('libosmocore-git' 'talloc' 'sofia-sip')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
backup=('etc/osmocom/osmo-sip-connector.cfg')
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
