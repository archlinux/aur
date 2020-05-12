# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Diego Principe <cdprincipe@at@gmail@dot@com>
# Contributor: PAblo Lezaeta <prflr88@gmail.com>

_pkgname=xfce4-whiskermenu-plugin
pkgname=${_pkgname}-git
pkgver=2.4.0+43+g86b6bff
pkgrel=1
pkgdesc="Alternate Xfce menu"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="http://gottcode.org/${_pkgname}/"
license=("GPL2")
depends=("xfce4-panel" "exo>=0.11")
makedepends=("cmake" "git")
groups=("xfce4-goodies" "xfce4-goodies-git")
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/panel-plugins/${_pkgname}")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr  -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
