# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfwl4
pkgname=${_pkgname}-devel
pkgver=4.21.0
pkgrel=1
pkgdesc="Wayland compositor for xfce4 (development snapshot)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://gitlab.xfce.org/xfce/xfwl4"
license=('GPL-3.0-or-later')
groups=('xfce4-devel')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
depends=('gtk3' 'xfconf>=4.21.2' 'libxfce4ui>=4.21.4' 'libdisplay-info' 'libdrm' 'libinput' 'mesa' 'pixman'
         'seatd' 'libxkbcommon' 'xorg-xwayland')
# Runtime only
depends+=('xfwm4' 'xfce4-settings>=4.21.2' 'xfdesktop>=4.21.0')
makedepends=('cargo' 'rust' 'meson' 'gettext')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('1e2ba9c8aa21d1adf723e7d3ef22f38c474a2f0d557de8caa6fa1591a1f8fe3e')

build() {
  local meson_options=(
    -Duse-system-gettext=true
  )

  arch-meson "${_pkgname}-${pkgver}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
