# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=thunar-media-tags-plugin
pkgname=${_pkgname}-git
pkgver=0.6.0+7+g5e56430
pkgrel=1
pkgdesc="Adds special features for media files to the Thunar File Manager (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL-2.0-or-later')
url="https://docs.xfce.org/xfce/thunar/media-tags"
groups=('xfce4-goodies-git')
depends=('taglib' 'thunar')
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
