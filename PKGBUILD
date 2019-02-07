# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-ggsn-git
pkgver=1.3.0
pkgrel=1
pkgdesc="Open Source implementation of a GGSN (Gateway GPRS Support Node)"
url="https://osmocom.org/projects/openggsn"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore')
makedepends=('git' 'talloc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-ggsn.cfg')
source=("git+https://git.osmocom.org/${pkgname%-git}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  autoreconf -i
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
