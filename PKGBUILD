# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-dev-tools
pkgname=${_pkgname}-devel
pkgver=4.21.3
pkgrel=1
pkgdesc="Xfce developer tools (Development release)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-dev-tools/start"
license=('GPL-2.0-or-later')
depends=('glib2' 'libxslt')
makedepends=('meson')
optdepends=('docker: xfce-build helper script')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/xfce4-dev-tools/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('e3137493ed47e36a4a177843e9043c7959eaf412e50600de4ab62d3454f50902')

build() {
  local meson_options=(
  )
  arch-meson "${_pkgname}-${pkgver}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
