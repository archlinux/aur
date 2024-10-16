# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=libxfce4windowing
pkgname=${_pkgname}-devel
pkgver=4.19.7
pkgrel=1
pkgdesc="Windowing concept abstraction library for X11 and Wayland (Development version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/libxfce4windowing/start"
license=('LGPL2.1')
groups=('xfce4-devel')
depends=('libwnck3' 'wayland' 'libdisplay-info')
makedepends=('meson' 'xfce4-dev-tools>=4.19.2' 'gtk-doc' 'gobject-introspection' 'wayland-protocols' 'wlr-protocols')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('eab7ae625e6dda2608fa63a4b3df96b2a192de6ae8980e77bfe43a4749c707a4')

build() {
  local meson_options=(
    -D gtk-doc=true
    -D x11=enabled
    -D wayland=enabled
  )

  arch-meson "${_pkgname}-${pkgver}" build "${meson_options[@]}"
  meson compile -C build
}


package() {
  meson install -C build --destdir "$pkgdir"
}
