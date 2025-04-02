# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-appfinder
pkgname=${_pkgname}-devel
pkgver=4.21.0
pkgrel=1
pkgdesc="Application finder for Xfce (development release)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-appfinder/start"
license=('GPL-2.0-or-later')
groups=('xfce4-devel')
depends=('libxfce4ui>=4.21.0' 'garcon' 'xfconf' 'hicolor-icon-theme')
makedepends=('meson')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=('xfce-utils')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz")
sha256sums=('e3befc3e73d2315074eb88933f2b042c5b417f4f7f24be9bd4f4508a091037b7')

build() {
  local meson_options=(
  )

  arch-meson "${_pkgname}-${pkgver}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
