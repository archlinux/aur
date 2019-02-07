# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-bsc-git
pkgver=1.4.0.15.g7cfdbe727
pkgrel=1
pkgdesc="Open Source BSC (GSM Base Station Controller) with A-bis/IP and A/IP interface"
url="https://osmocom.org/projects/osmobsc"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'libosmo-abis' 'libosmo-sccp' 'osmo-mgw')
makedepends=('git' 'talloc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
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
