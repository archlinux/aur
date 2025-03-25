# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=libosmo-pfcp-git
pkgver=0.5.0.r1.g771ba85
pkgrel=1
pkgdesc="PFCP protocol encoding and decoding, and generic PFCP endpoint implementation"
arch=('any')
url="https://osmocom.org/projects/libosmo-pfcp"
license=('GPL-2.0-or-later')
depends=('libosmocore-git')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver}"
          'libosmo-gtlv.so=1-64'
          'libosmo-pfcp.so=4-64')
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
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname%-git}"
  make check
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
