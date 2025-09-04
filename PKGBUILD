# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-indicator-plugin
pkgname=${_pkgname}-git
pkgver=2.5.0+99+g9ae1acd
pkgrel=1
pkgdesc="Display indicators in the Xfce4 panel (git checkout)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://docs.xfce.org/panel-plugins/xfce4-indicator-plugin/start'
license=('GPL')
depends=('hicolor-icon-theme' 'libayatana-indicator' 'xfce4-panel' 'xdg-utils')
makedepends=('meson' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
source=("${_pkgname}::git+https://gitlab.xfce.org/panel-plugins/xfce4-indicator-plugin")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/-/+/g"
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
