# Maintainer:  twa022 <twa022 at gmail dot com>
 
_pkgname=thunar-shares-plugin
pkgname=${_pkgname}-git
pkgver=0.5.0+6+g3fb2a5d
pkgrel=1
pkgdesc="Thunar plugin to quickly share a folder using Samba without requiring root access"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://goodies.xfce.org/projects/thunar-plugins/${_pkgname}"
license=('GPL-2.0-or-later')
depends=('thunar' 'samba')
makedepends=('meson' 'xfce4-dev-tools' 'git')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/thunar-plugins/${_pkgname}")
sha256sums=('SKIP')
 
pkgver() {
  cd "${srcdir}/${_pkgname}"
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
