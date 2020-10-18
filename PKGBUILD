# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=labwc
pkgname=labwc-git
pkgver=r236.f49a3a0
pkgrel=1
pkgdesc='stacking wayland compositor with look and fell from openbox (git version)'
url="https://github.com/johanmalm/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wlroots' 'wayland' 'wayland-protocols' 'xorg-server-xwayland')
makedepends=('git' 'meson')
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/johanmalm/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  arch-meson ../build
  ninja -v -C ../build
}

package() {
  cd "$_pkgname"
  DESTDIR="${pkgdir}" meson install -C ../build
}
