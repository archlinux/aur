# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libevdev-git
pkgver=1.6.0.r6.g55d7375
pkgrel=1
pkgdesc="Wrapper library for evdev devices"
arch=('i686' 'x86_64')
url="https://www.freedesktop.org/wiki/Software/libevdev/"
license=('custom:X11')
depends=('glibc')
makedepends=('git')
provides=('libevdev')
conflicts=('libevdev')
options=('staticlibs')
source=("git+https://gitlab.freedesktop.org/libevdev/libevdev")
sha256sums=('SKIP')


pkgver() {
  cd "libevdev"

  git describe --long --tags | sed 's/^libevdev-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libevdev"

  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libevdev"

  make check
}

package() {
  cd "libevdev"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/libevdev/COPYING"
}
