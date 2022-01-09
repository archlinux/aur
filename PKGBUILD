# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-indicator-plugin
pkgname=${_pkgname}-git
pkgver=2.4.1+47+g536586c
pkgrel=1
pkgdesc="Display indicators in the Xfce4 panel"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://goodies.xfce.org/projects/panel-plugins/${_pkgname}"
license=('GPL')
depends=('hicolor-icon-theme'
         'libindicator-gtk2'
         'libindicator-gtk3'
         'xfce4-panel'
         'xdg-utils')
makedepends=('intltool' 'xfce4-dev-tools' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
source=("${_pkgname}::git+https://gitlab.xfce.org/panel-plugins/xfce4-indicator-plugin")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/-/+/g"
}

build() {
  cd "${_pkgname}"
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --disable-static
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
