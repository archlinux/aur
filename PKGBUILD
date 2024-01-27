# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=libosmo-abis-git
pkgver=1.5.0.r5.gaa3452c
pkgrel=1
pkgdesc="Osmocom library for A-bis interface"
url="https://osmocom.org/projects/libosmo-abis"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'ortp' 'talloc')
makedepends=('git')
provides=("libosmoabis.so=${pkgver}"
          "libosmotrau.so=${pkgver}")
conflicts=("${pkgname%-git}")
source=("git+https://gitea.osmocom.org/osmocom/${pkgname%-git}.git")
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
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --disable-dahdi
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
