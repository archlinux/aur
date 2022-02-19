# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=labwc
pkgname=labwc-git
pkgver=0.5.0.r1.g68d897e
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (git version)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'seatd' 'wlroots>=0.15' 'wlroots<0.16' 'wayland' 'wayland-protocols' 'xorg-xwayland')
makedepends=('git' 'meson' 'scdoc')
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
  cd "$_pkgname"
  arch-meson -Dman-pages=enabled ../build
  ninja -v -C ../build
}

package() {
  cd "$_pkgname"
  DESTDIR="${pkgdir}" meson install -C ../build
}
