# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-bts-git
pkgver=0.8.1.r218.g3933e93
pkgrel=1
pkgdesc="Open Source GSM BTS (Base Transceiver Station) with A-bis/IP interface"
url="https://osmocom.org/projects/osmobts"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'talloc' 'libosmo-abis' 'ortp')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-bts-trx.cfg' 'etc/osmocom/osmo-bts-virtual.cfg')
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
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-trx
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
