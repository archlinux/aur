# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: m4sk1n <m4sk1n@o2.pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

_pkgname=libxfce4ui
pkgname=${_pkgname}-devel
pkgver=4.21.8
pkgrel=1
pkgdesc="Commonly used Xfce widgets among Xfce applications (Development version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/libxfce4ui/start"
license=('GPL-2.0-or-later')
groups=('xfce4-devel')
depends=('libxfce4util' 'gtk3' 'xfconf' 'libsm' 'startup-notification' 'libgudev' 
         'libgtop' 'libepoxy' 'hicolor-icon-theme')
makedepends=('gtk-doc' 'gobject-introspection' 'vala' 'xfce4-dev-tools' 'meson')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('e6caafc6fe5e07765e22dd849a19b21e5aa44f51c66fa1d7db74b94330bd457b')

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
