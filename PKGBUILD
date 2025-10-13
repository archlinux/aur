# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=libosmo-sccp-git
pkgver=1.9.0.r4.gdc822182
pkgrel=1
pkgdesc="Osmocom library for SCCP (DEPRECATED)"
url="https://osmocom.org/projects/libosmo-sccp"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later')
depends=('libosmocore-git' 'libosmo-netif-git' 'lksctp-tools' 'talloc')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver}"
          'libosmo-sigtran.so=10-64')
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-stp.cfg')
source=("git+https://gitea.osmocom.org/osmocom/${pkgname%-git}.git")
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

check() {
  cd "${pkgname%-git}"
  make check
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
