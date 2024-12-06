# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfdesktop
pkgname=${_pkgname}-devel
pkgver=4.19.7
pkgrel=1
pkgdesc="A desktop manager for Xfce (development release)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://docs.xfce.org/xfce/xfdesktop/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('thunar' 'garcon' 'hicolor-icon-theme' 'libxfce4windowing>=4.19.8' 'gtk-layer-shell' 'libyaml')
makedepends=('glib2-devel' 'meson')
conflicts=('xfce4-menueditor' "${_pkgname}")
provides=("${_pkgname}=${pkgver}")
replaces=('xfce4-menueditor')
options=('!libtool')
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('50d462a1e3d827b3489ddf5bb4efaedf53cc09c564c4d4249faef329e5d84366')

build() {
  local meson_options=(
    -D x11=enabled
    -D wayland=enabled
    -D desktop-menu=enabled
    -D tests=false
  )

  arch-meson "${_pkgname}-${pkgver}" build "${meson_options[@]}"
  meson compile -C build
}


package() {
  meson install -C build --destdir "$pkgdir"
}
