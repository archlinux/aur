# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=pps-tools-git
pkgver=r23.9d82bc4
pkgrel=1
pkgdesc="LinuxPPS user-space tools"
arch=('aarch64' 'arm7vh' 'i686' 'x86_64')
url="http://linuxpps.org/"
license=('GPL2')
provides=('pps-tools')
source=("git+https://github.com/ago/pps-tools")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
