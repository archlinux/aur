# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-taskmanager
pkgname=${_pkgname}-git
pkgver=1.5.8+14+g8460ab7
pkgrel=1
pkgdesc="Easy to use task manager"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="http://goodies.xfce.org/projects/applications/xfce4-taskmanager"
license=('GPL2')
depends=('libwnck3' 'libxfce4ui' 'xfconf')
makedepends=('meson' 'git' 'xfce4-dev-tools')
provides=("${_pkgname}=${pkgver%%+}")
conflicts=("${_pkgname}")
groups=('xfce4-goodies')
source=("${_pkgname}::git+https://gitlab.xfce.org/apps/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  local meson_options=(
    -D x11=enabled
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
