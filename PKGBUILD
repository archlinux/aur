# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=garcon
pkgname=${_pkgname}-devel
pkgver=4.21.0
pkgrel=1
pkgdesc="Implementation of the freedesktop.org menu specification"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/tumbler/start"
license=('GPL-2.0-or-later')
groups=('xfce4-devel')
depends=('libxfce4ui>=4.21.0')
makedepends=('meson' 'xfce4-dev-tools' 'gobject-introspection' 'gtk-doc')
replaces=('libxfce4menu')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/garcon/${pkgver%.*}/$_pkgname-$pkgver.tar.xz")
sha256sums=('3acc3f6b81059199f4e6646da7b6ca39edf84ea90dd3ff87088ffca6aa108269')

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
