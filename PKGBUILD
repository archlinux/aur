# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Lex Black <autumn-wind@web.de>

_pkgname=labwc
pkgname=labwc-atomic-tearing-git
pkgver=0.7.1.r94.g6e7f1b43
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (git version)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'wlroots-hidpi-xprop' 'wayland' 'xorg-xwayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/labwc/${_pkgname}.git"
        'labwc-atomic-tearing.patch')
md5sums=('SKIP'
         '9d737e6f4cc42aacbf2018aa912bd0b8')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -Np1 -i "${srcdir}/labwc-atomic-tearing.patch"
}

build() {
  arch-meson -Dman-pages=enabled "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
