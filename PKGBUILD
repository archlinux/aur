# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-iuh-git
pkgver=1.5.1.r1.ga2516476
pkgrel=1
pkgdesc="Osmocom code for the Iuh interface (HNBAP, RUA, RANAP)"
url="http://osmocom.org/projects/osmohnbgw"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'libosmo-netif' 'libosmo-sccp' 'talloc' 'libasn1c' 'lksctp-tools')
makedepends=('git')
provides=('libosmo-hnbap.so=0-64'
          'libosmo-ranap.so=7-64'
          'libosmo-rua.so=0-64'
          'libosmo-sabp.so=1-64')
conflicts=("${pkgname%-git}")
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
