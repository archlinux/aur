# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfdesktop
pkgname=${_pkgname}-devel
pkgver=4.21.1
pkgrel=1
pkgdesc="A desktop manager for Xfce (development release)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://docs.xfce.org/xfce/xfdesktop/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('thunar' 'garcon' 'hicolor-icon-theme' 'libxfce4ui>=4.21.0'
         'libxfce4windowing' 'gtk-layer-shell' 'libyaml' 'xfce4-session>=4.21.2')
makedepends=('glib2-devel' 'meson' 'gst-plugin-gtk')
optdepends=('gst-plugin-gtk: Video backgrounds')
conflicts=('xfce4-menueditor' "${_pkgname}")
provides=("${_pkgname}=${pkgver}")
replaces=('xfce4-menueditor')
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('a1b798d045c8b188af49503e2b015632b460cd179e1893cb3d2eec93eb59a33f')

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
