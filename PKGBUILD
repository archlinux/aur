# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=libosmo-abis-git
pkgver=0.6.0.2.g3a2aa09
pkgrel=1
pkgdesc="This is the A-bis interface library as used by OsmoBSC/OsmoNITB"
url="https://osmocom.org/projects/libosmo-abis"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'ortp')
makedepends=('git' 'talloc')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
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
