# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=osmo-uecups-git
pkgver=0.2.2.r14.g6cb3ba1
pkgrel=1
pkgdesc="Osmocom UE simulation control/user plane separation"
url="https://osmocom.org/projects/osmo-uecups/wiki"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
depends=('jansson'
         'libnl'
         'lksctp-tools'
         'libosmocore-git'
         'libosmo-netif-git')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
backup=('etc/osmocom/osmo-uecups-daemon.cfg')
source=("git+https://gitea.osmocom.org/cellular-infrastructure/${pkgname%-git}.git")
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
              --bindir=/usr/bin
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
