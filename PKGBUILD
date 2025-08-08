# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=thunar-archive-plugin
pkgname=${_pkgname}-git
pkgver=0.6.0+6+g5381465
pkgrel=1
pkgdesc="Adds archive operations to the Thunar file context menus"
arch=('x86_64')
url="https://docs.xfce.org/xfce/thunar/archive"
license=('GPL-2.0-only')
groups=('xfce4-goodies-git')
depends=('thunar' 'hicolor-icon-theme')
makedepends=('git' 'meson' 'xfce4-dev-tools')
optdepends=('file-roller' 'engrampa' 'ark' 'xarchiver')
source=("${_pkgname}::git+https://gitlab.xfce.org/thunar-plugins/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  arch-meson "${_pkgname}" build \
    --localstatedir=/var \
    --libexecdir=/usr/lib/xfce4
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
