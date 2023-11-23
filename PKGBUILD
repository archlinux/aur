# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=labwc
pkgname=labwc-git
pkgver=0.6.5.r117.g1b8e404c
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (git version)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'wlroots0.16' 'wayland' 'xorg-xwayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/labwc/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export PKG_CONFIG_PATH='/usr/lib/wlroots0.16/pkgconfig'
  arch-meson -Dman-pages=enabled "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
