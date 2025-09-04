# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-pulseaudio-plugin
pkgname=${_pkgname}-git
pkgver=0.5.1+118+ga2e87eb
pkgrel=1
pkgdesc="Pulseaudio plugin for Xfce4 panel"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL-2.0-or-later')
url="https://goodies.xfce.org/projects/panel-plugins/xfce4-pulseaudio-plugin"
groups=('xfce4-goodies-git')
depends=('xfce4-panel' 'libpulse' 'libkeybinder3' 'libnotify' 'libcanberra')
makedepends=('git' 'meson' 'xfce4-dev-tools')
optdepends=('pavucontrol: default pulseaudio mixer')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
source=("${_pkgname}::git+https://gitlab.xfce.org/panel-plugins/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  local meson_options=(
    --localstatedir=/var
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
