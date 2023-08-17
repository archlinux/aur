# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-panel-profiles
pkgname=${_pkgname}-git
pkgver=1.0.14+7+g11fd0b6
pkgrel=1
pkgdesc="Simple application to manage Xfce panel layouts"
arch=('any')
url="https://docs.xfce.org/apps/xfce4-panel-profiles/start"
license=('GPL3')
depends=('xfce4-panel' 'python-gobject' 'python-psutil')
makedepends=('intltool' 'git')
conflicts=('xfpanel-switch' "${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
source=("${_pkgname}::git+https://gitlab.xfce.org/apps/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make install DESTDIR="${pkgdir}"
}
