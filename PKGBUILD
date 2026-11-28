# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=libxfce4util
pkgname=${_pkgname}-devel
pkgver=4.21.1
pkgrel=1
pkgdesc="Basic utility non-GUI functions for Xfce (development release)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/libxfce4util/start"
license=('GPL-2.0-or-later')
groups=('xfce4-devel')
depends=('glib2')
makedepends=('gtk-doc' 'gobject-introspection' 'vala')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('509e0ead3bc98c4f04b79069be7521b7cc35b63702262e148c5364b5a08e2e9a')

build() {
  local meson_options=(
    -D gtk-doc=true
    -D vala=enabled
  )

  arch-meson "${_pkgname}-${pkgver}" build "${meson_options[@]}"
  meson compile -C build
}


package() {
  meson install -C build --destdir "$pkgdir"
}
