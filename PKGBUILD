# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=labwc
pkgname=labwc-git
pkgver=r100.93d5809
pkgrel=1
pkgdesc='stacking wayland compositor with look and fell from openbox (git version)'
url="https://github.com/johanmalm/labwc"
arch=('x86_64')
license=('GPL2')
depends=('wlroots' 'wayland' 'wayland-protocols' 'xorg-server-xwayland')
makedepends=('git' 'meson')
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/johanmalm/${_pkgname}.git"
        "remove-werror.patch")
md5sums=('SKIP'
         '7a04a45415b125dee8d46dab20039a2c')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  patch -Np0 -i remove-werror.patch
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
