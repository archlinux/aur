# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=libosmo-netif-git
pkgver=1.4.0.r20.g96e26d5
pkgrel=2
pkgdesc="Osmocom library for muxed audio"
url="http://osmocom.org/projects/libosmo-netif"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('lksctp-tools' 'libpcap' 'libosmocore' 'libosmo-abis')
makedepends=('git')
provides=("libosmonetif.so=11-64")
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

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
