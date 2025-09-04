#Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=thunar-volman
pkgname=${_pkgname}-git
epoch=1
pkgver=4.20.0+11+gc6c47d7
pkgrel=1
pkgdesc="Automatic management of removable drives and media for Thunar (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL-2.0-or-later')
url="https://docs.xfce.org/xfce/thunar/thunar-volman"
groups=('xfce4-goodies-git')
depends=('thunar' 'libxfce4ui>=4.21.0' 'hicolor-icon-theme')
makedepends=('git' 'meson' 'xfce4-dev-tools')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
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
