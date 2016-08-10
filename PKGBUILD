# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lightning <sgsdxzy@gmail.com>

pkgname=odhcp6c-git
pkgver=v1.1.r54.g7533a62
pkgrel=1
pkgdesc='minimal DHCPv6 and RA-client for use in embedded Linux systems'
arch=('x86_64' 'i686')
url='https://wiki.openwrt.org/doc/techref/odhcp6c'
license=('GPL2')
makedepends=('cmake' 'git')
provides=('odhcp6c')
conflicts=('odhcp6c')
source=('odhcp6c::git+https://github.com/sbyx/odhcp6c')
md5sums=('SKIP')

pkgver() {
  cd odhcp6c
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p odhcp6c/build
}

build() {
  cd odhcp6c/build
  cmake .. -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd odhcp6c/build
  make DESTDIR="$pkgdir/" install
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}

# vim: ts=2 sw=2 et:
