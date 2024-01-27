# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-mgw-git
pkgver=1.12.1.r28.g8ee08c6b7
pkgrel=1
pkgdesc="Osmocom's Media Gateway for 2G and 3G circuit-switched mobile networks"
url="https://osmocom.org/projects/osmo-mgw/"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'libosmo-abis' 'libosmo-netif' 'talloc')
makedepends=('git')
provides=('libosmo-mgcp-client.so=12-64')
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-mgw.cfg')
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
