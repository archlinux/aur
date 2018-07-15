# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-panel-profiles
pkgname=${_pkgname}-git
pkgver=1.0.7+60+g793a74d
pkgrel=1
pkgdesc="Simple application to manage Xfce panel layouts"
arch=('any')
url="https://launchpad.net/xfpanel-switch"
license=('GPL3')
depends=('xfce4-panel' 'gtk3' 'python-gobject')
makedepends=('intltool' 'git')
conflicts=('xfpanel-switch' "${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
source=("git://git.xfce.org/apps/xfce4-panel-profiles")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}-::;s/-/+/g"
}

prepare() {
  find "${srcdir}/${_pkgname}/po/" -type f -name *po -exec sed -i 's:charset=CHARSET:charset=UTF-8:' '{}' \;
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr --python=python
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make install DESTDIR="${pkgdir}"
}
