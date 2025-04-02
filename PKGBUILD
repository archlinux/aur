# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfconf
pkgname=${_pkgname}-devel
pkgver=4.21.0
pkgrel=1
pkgdesc="A simple client-server configuration storage and query system"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfconf/start"
license=('GPL-2.0-or-later')
groups=('xfce4-devel')
depends=('libxfce4util')
makedepends=('meson' 'xfce4-dev-tools' 'gtk-doc' 'vala' 'gobject-introspection' 'glib2-devel')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('0c2d749cc9109e5c5f2b92687faa20b7136c38ff5873e3b5d3ee53fe4e7cf1d4')

build() {
  local meson_options=(
    -D gtk-doc=true
  )

  arch-meson "${_pkgname}-${pkgver}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
