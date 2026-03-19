# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfconf
pkgname=${_pkgname}-devel
pkgver=4.21.2
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
sha256sums=('99aa4366e909ba7b9f746aba48b610b9e9d2933aeb283c7fa5f37a7c3dc7a3a6')

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
