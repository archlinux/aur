# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=libosmo-sccp-git
pkgver=1.0.0.1.g0a93a68
pkgrel=1
pkgdesc="Osmocom SCCP + Sigtran (M3UA, SUA) library"
url="http://openbsc.osmocom.org/trac/wiki/libosmo-sccp"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'libosmo-netif' 'lksctp-tools')
makedepends=('git')
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
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
