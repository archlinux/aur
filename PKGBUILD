# Maintainer: tecknian <user393220@proton.me>
pkgname=hevel-git
pkgrel=1
pkgver=0.0.1
pkgdesc='a transparent window system for wayland'
arch=('x86_64')
url='git+https://git.sr.ht/~dlm/hevel'
license=('ISC')
depends=('swc-git' 'wld-git' 'wayland' 'wayland-protocols' 'libdrm' 'libxkbcommon' 'pixman' 'xcb-util-wm' 'libxcb' 'systemd-libs' 'libinput' 'xorg-xwayland')
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
  export CFLAGS="-pipe -O2"
  make
}

package() {
  cd "$srcdir/hevel"
  make install DESTDIR="$pkgdir"
}
