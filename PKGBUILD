# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-sgsn-git
pkgver=1.4.0.r0.g319a52b5
pkgrel=1
pkgdesc="Open Source implementation of a SGSN (Serving GPRS Support Node)"
url="https://osmocom.org/projects/osmosgsn"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'talloc' 'osmo-ggsn' 'osmo-iuh' 'osmo-hlr' 'libasn1c' 'c-ares')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-sgsn.cfg')
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
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-iu
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
