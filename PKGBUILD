# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfdesktop
pkgname=${_pkgname}-devel
pkgver=4.19.5
pkgrel=1
pkgdesc="A desktop manager for Xfce (development release)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://docs.xfce.org/xfce/xfdesktop/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('thunar' 'garcon' 'hicolor-icon-theme' 'libxfce4windowing>=4.19.7' 'gtk-layer-shell' 'libyaml')
makedepends=('glib2-devel' 'meson')
conflicts=('xfce4-menueditor' "${_pkgname}")
provides=("${_pkgname}=${pkgver}")
replaces=('xfce4-menueditor')
options=('!libtool')
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('95e21be4a6ad802de80e8402b17704266a6f80b8cb9d97b6c7934f5cb4b2f472')

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
