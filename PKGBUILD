# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=libosmo-abis-git
pkgver=0.6.0.r2.g3a2aa09
pkgrel=1
pkgdesc="This is the A-bis interface library as used by OsmoBSC/OsmoNITB"
url="https://osmocom.org/projects/libosmo-abis"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'ortp' 'talloc')
makedepends=('git')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
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
