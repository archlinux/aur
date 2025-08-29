# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-weather-plugin
pkgname=${_pkgname}-git
pkgver=0.12.0+103+gf0954ec
pkgrel=1
pkgdesc="A weather plugin for the Xfce4 panel (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://docs.xfce.org/panel-plugins/xfce4-weather-plugin/start"
license=('GPL-2.0-or-later')
groups=('xfce4-goodies-git')
depends=('xfce4-panel' 'libxml2' 'libsoup3' 'hicolor-icon-theme' 'upower')
makedepends=('xfce4-dev-tools' 'git' 'meson')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
source=("${_pkgname}::git+https://gitlab.xfce.org/panel-plugins/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  local meson_options=(
    -D upower-glib=enabled
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
