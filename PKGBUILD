# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-hlr-git
pkgver=1.0.0.6.gf9cf180
pkgrel=1
pkgdesc="Subscriber database and authentication key store of an Osmocom 2G/3G network"
url="https://osmocom.org/projects/osmo-hlr"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'libosmo-abis' 'sqlite' 'libdbi' 'libdbi-drivers')
makedepends=('git' 'talloc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-hlr.cfg')
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
