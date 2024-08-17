# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=libgtpnl-git
pkgver=1.3.0.r0.33afef9
pkgrel=2
pkgdesc="netlink library for Linux kernel GTP code"
url="https://osmocom.org/projects/linux-kernel-gtp-u/wiki/Libgtpnl"
arch=('x86_64')
license=('LGPL-2.1-only')
depends=('libmnl')
conflicts=("${pkgname}")
provides=("${pkgname%-git}=${pkgver}"
          'libgtpnl.so=0-64')
source=("git+https://gitea.osmocom.org/cellular-infrastructure/libgtpnl.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  autoreconf -i
  ./configure --prefix=/usr \
              --libdir=/usr/lib/ \
              --libexecdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
