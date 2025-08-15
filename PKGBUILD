# Maintainer: NEOAPPS <asd22.info@gmail.com>
pkgname=wyvern-git
pkgver=r4.0e06767
pkgrel=1
pkgdesc="Very minimal Wayland compositor written in Rust"
arch=('any')
url="https://github.com/neoapps-dev/wyvern"
license=('GPL-3.0')
depends=(
  systemd
  cairo
  gcc-libs
  glib2
  glibc
  glslang
  libdisplay-info
  libdrm
  libglvnd
  libinput
  libliftoff
  libx11
  libxcb
  libxcomposite
  libxcursor
  libxfixes
  libxkbcommon
  libxrender
  mesa
  opengl-driver
  pango
  pixman
  polkit
  re2
  seatd
  systemd-libs
  tomlplusplus
  util-linux-libs
  wayland
  wayland-protocols
  xcb-proto
  xcb-util
  xcb-util-errors
  xcb-util-image
  xcb-util-keysyms
  xcb-util-renderutil
  xcb-util-wm
  xorg-xwayland
)
makedepends=('git' 'cargo' 'rust')
provides=('wyvern')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/wyvern "$pkgdir/usr/bin/wyvern"
}
