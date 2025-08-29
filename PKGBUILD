# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Cedric Leporcq <cedric at gmail dot com>

_pkgname=xfce4-windowck-plugin
pkgname=${_pkgname}-git
epoch=1
pkgver=0.6.1+82+g28afc52
pkgrel=1
pkgdesc="Xfce panel plugin for displaying window title and buttons"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gitlab.xfce.org/panel-plugins/xfce4-windowck-plugin/"
license=('GPL-3.0-or-later')
depends=('xfce4-panel' 'libwnck3')
makedepends=('xfce4-dev-tools' 'python' 'git' 'meson')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
options=('!libtool')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  local meson_options=(
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
