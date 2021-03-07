# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=labwc
pkgname=labwc-git
pkgver=0.1.0.r6.g6ece805
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (git version)'
url="https://github.com/johanmalm/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wlroots' 'wayland' 'wayland-protocols' 'xorg-xwayland')
makedepends=('git' 'meson')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/johanmalm/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  arch-meson -Dman-pages=disabled ../build
  ninja -v -C ../build
}

package() {
  cd "$_pkgname"
  DESTDIR="${pkgdir}" meson install -C ../build
}
