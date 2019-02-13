# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-hlr-git
pkgver=1.0.0.r6.gf9cf180
pkgrel=1
pkgdesc="Subscriber database and authentication key store of an Osmocom 2G/3G network"
url="https://osmocom.org/projects/osmo-hlr"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'libosmo-abis' 'talloc' 'sqlite' 'libdbi' 'libdbi-drivers')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-hlr.cfg')
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
