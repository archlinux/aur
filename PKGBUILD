# Maintainer: tecknian <user393220@proton.me>
pkgname=hevel-git
pkgrel=1
pkgver=r48.904b951
pkgdesc='a transparent window system for wayland'
arch=('x86_64')
url='git+https://git.sr.ht/~dlm/hevel'
license=('ISC')
depends=('wld-git' 'wayland' 'wayland-protocols' 'libdrm' 'libxkbcommon' 'pixman' 'xcb-util-wm')
makedepends=('gcc' 'git' 'make')
provides=("${pkgname%-git}")
conflicts=()
source=("$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/hevel"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/hevel"
  export LDFLAGS="-s -static"
  make
}

package() {
  cd "$srcdir/hevel"
  
  # Install main binaries
  install -D -m 4755 swc/launch/swc-launch "$pkgdir/usr/bin/swc-launch"
  install -D -m 755 hevel "$pkgdir/usr/bin/hevel"
  install -D -m 755 swcsnap "$pkgdir/usr/bin/swcsnap"
  install -D -m 755 hbar "$pkgdir/usr/bin/hbar"
  
  # Install SWC library files
  install -D -m 644 swc/libswc/libswc.a "$pkgdir/usr/lib/libswc.a"
  install -D -m 644 swc/libswc/swc.h "$pkgdir/usr/include/swc.h"
  install -D -m 644 swc/protocol/swc.xml "$pkgdir/usr/share/swc/swc.xml"
  install -D -m 644 swc/swc.pc "$pkgdir/usr/lib/pkgconfig/swc.pc"
}
