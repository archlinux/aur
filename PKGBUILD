# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=thunar-vcs-plugin
pkgname=${_pkgname}-git
pkgver=0.2.0+87+gcf09392
pkgrel=1
pkgdesc="SVN and GIT integration for Thunar."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL')
url="https://goodies.xfce.org/projects/thunar-plugins/thunar-vcs-plugin"
depends=('thunar>=1.7.0' 'git' 'subversion' 'apr')
makedepends=('intltool' 'xfce4-dev-tools')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/thunar-plugins/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  cd "${_pkgname}"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
