# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=libosmo-netif-git
pkgver=0.4.0.13.g1a35772
pkgrel=1
pkgdesc="Osmocom network interface library"
url="http://osmocom.org/projects/libosmo-netif"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'libosmo-abis' 'lksctp-tools' 'ortp')
makedepends=('git')
depends=("${pkgname%-git}")
makedepends=("${pkgname%-git}")
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
