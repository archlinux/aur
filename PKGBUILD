# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=pps-tools-git
pkgver=1.0.r0.9d82bc4
pkgrel=1
pkgdesc="LinuxPPS user-space tools"
arch=('aarch64' 'arm7vh' 'i686' 'x86_64')
url="http://linuxpps.org/"
license=('GPL2')
provides=('pps-tools')
makedepends=('git')
source=("git+https://github.com/ago/pps-tools")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  printf %s "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g')"
}

build() {
  cd "${pkgname%-git}"
  LDLIBS=-lm make
}

package() {
  cd "${pkgname%-git}"

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/include/sys"

  LDLIBS=-lm make DESTDIR="$pkgdir/" install
}
