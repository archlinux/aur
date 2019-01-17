# Maintainer: physkets <physkets // at // tutanota dot com>
# Contributor: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>

_pkgname=tox-weechat
pkgname="${_pkgname}-git"
pkgver=r348.424eacc
pkgrel=1

pkgdesc='Tox protocol plugin for WeeChat'
arch=('i686' 'x86_64')
url="https://github.com/haavard/${_pkgname}"
license=('GPL3')
depends=('toxcore' 'weechat')
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+https://github.com/haavard/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="${pkgdir}/" install
}
