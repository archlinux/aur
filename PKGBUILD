# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=labwc
pkgname=labwc-hdr-metadata-git
pkgver=0.9.5.r131.gbce14a5a
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (HDR metadata test)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libpng' 'librsvg' 'libsfdo' 'pango' 'seatd' 'ttf-font' 'wlroots-hidpi-xprop-hdr-metadata-git' 'wayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols' 'xorg-xwayland')
optdepends=("bemenu: default launcher via Alt+F3"
            "xorg-xwayland: X11 support")
conflicts=(labwc-git labwc)
provides=(labwc-git labwc)
source=("git+https://github.com/labwc/${_pkgname}.git"
	'labwc-wlroots021.patch')
md5sums=('SKIP'
         'ccd04c2a977980257ac9fbb479cf6cb9')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -Np1 -i ../labwc-wlroots021.patch
}

build() {
  arch-meson -Dman-pages=enabled "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
