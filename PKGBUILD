# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=labwc
pkgname=labwc-wlroots-018-git
pkgver=0.7.2.r95.ga466591e
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (git version) (Highly experimental bleeding edge wlroots version)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'wlroots-git' 'wayland' 'xorg-xwayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/labwc/${_pkgname}.git"
        'https://github.com/labwc/labwc/pull/1641.patch')
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd "$_pkgname"
  git checkout a466591e0dee4eb9eb2c7d653b56f1bc21606370
  patch -Np1 -i "$srcdir/1641.patch"
}

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson -Dman-pages=enabled "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
