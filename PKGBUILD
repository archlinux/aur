# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-panel
pkgname=${_pkgname}-devel
pkgver=4.21.3
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment (development release)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-panel/start"
license=('GPL-2.0-or-later')
groups=('xfce4-devel')
depends=('garcon' 'libxfce4ui>=4.21.8' 'xfconf' 'xfce4-session>=4.21.2' 'hicolor-icon-theme' 
         'desktop-file-utils' 'libdbusmenu-gtk3' 'libxfce4windowing' 'gtk-layer-shell')
makedepends=('meson' 'xfce4-dev-tools' 'gtk-doc' 'gobject-introspection' 'vala' 'glib2-devel')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" 'xfce4-statusnotifier-plugin')
replaces=('xfce4-statusnotifier-plugin')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('daa277162735e024552586dac0df24bf9e0ed3fdcaa3bc4210b97c0679013db3')

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
