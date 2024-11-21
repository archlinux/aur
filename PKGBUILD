# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=libosmo-netif-git
pkgver=1.5.1.r7.g75813dd7
pkgrel=1
pkgdesc="Osmocom's abstract network interfacing library"
url="http://osmocom.org/projects/libosmo-netif"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later')
depends=('lksctp-tools' 'libpcap' 'libosmocore-git')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver}"
          'libosmonetif.so=11-64')
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
              --localstatedir=/var
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
