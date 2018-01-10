# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=thunar-vcs-plugin
pkgname=${_pkgname}-git
pkgver=0.1.5+87+gb672feb
pkgrel=1
pkgdesc="SVN and GIT integration for Thunar."
arch=('i686' 'x86_64')
license=('GPL')
url="https://goodies.xfce.org/projects/thunar-plugins/thunar-vcs-plugin"
depends=('thunar>=1.7.0' 'git' 'subversion' 'apr')
makedepends=('intltool')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/andreldm/thunar-vcs-plugin#branch=gtk3")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}-::;s/-/+/g"
}

build() {
  cd "${_pkgname}"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR=$pkgdir install
}
