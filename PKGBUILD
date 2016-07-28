# $Id$
# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

_gitname=boinc-rpc-cpp
pkgname=$_gitname-git
pkgver=20160727_192500
pkgrel=1
pkgdesc="RPC API for BOINC client"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('boost')
depends=('boost-libs' 'glibmm' 'libxml++')
url="https://github.com/skybon/boinc-rpc-cpp"
source=("${_gitname}::git+https://github.com/skybon/boinc-rpc-cpp.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  date -u -d @$(git show -s --format=%ct HEAD) "+%Y%m%d_%H%M%S"
}

build() {
  cd "${srcdir}/${_gitname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
}
