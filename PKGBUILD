# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Diego Principe <cdprincipe@at@gmail@dot@com>
# Contributor: PAblo Lezaeta <prflr88@gmail.com>

_pkgname=xfce4-whiskermenu-plugin
pkgname=${_pkgname}-git
pkgver=2.1.0.r24.gc326f6f
pkgrel=1
pkgdesc="Alternate Xfce menu"
arch=("i686" "x86_64")
url="http://gottcode.org/${_pkgname}/"
license=("GPL2")
depends=("xfce4-panel" "exo>=0.11")
makedepends=("cmake" "git")
groups=("xfce4-goodies" "xfce4-goodies-git")
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+http://github.com/gottcode/xfce4-whiskermenu-plugin")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr  -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make install/strip DESTDIR=${pkgdir}
}
