# Maintainer:  twa022 <twa022 at gmail dot com>
 
_pkgname=thunar-shares-plugin
pkgname=${_pkgname}-git
pkgver=0.3.1+5+g723aa22
pkgrel=1
pkgdesc="Thunar plugin to quickly share a folder using Samba without requiring root access"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://goodies.xfce.org/projects/thunar-plugins/${_pkgname}"
license=('GPL2' 'LGPL')
depends=('thunar>=1.7.0' 'samba')
makedepends=('xfce4-dev-tools' 'git')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/thunar-plugins/${_pkgname}")
sha256sums=('SKIP')
 
pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}
 
build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 --enable-debug=no
  make
}
 
package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
