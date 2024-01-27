# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=libosmo-sccp-git
pkgver=1.8.0.r33.g02d664b1
pkgrel=2
pkgdesc="Osmocom SCCP + Sigtran (M3UA, SUA) library"
url="https://osmocom.org/projects/libosmo-sccp"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'libosmo-netif' 'lksctp-tools' 'talloc')
makedepends=('git')
provides=("libosmo-sigtran.so=9-64")
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

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
