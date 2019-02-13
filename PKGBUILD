# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-ggsn-git
pkgver=1.3.0.r0.gf5a268a
pkgrel=1
pkgdesc="Open Source implementation of a GGSN (Gateway GPRS Support Node)"
url="https://osmocom.org/projects/openggsn"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'talloc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-ggsn.cfg')
source=("git+https://git.osmocom.org/${pkgname%-git}")
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
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
