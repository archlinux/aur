# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=rpclib-git
pkgver=r598.08e4171
pkgrel=1
pkgdesc="rpclib is a modern C++ msgpack-RPC server and client library"
arch=('i686' 'x86_64')
license=(MIT)
makedepends=('git' 'cmake')
depends=()
provides=('rpclib')
conflicts=('rpclib')
_name=rpclib
source=("git+https://github.com/rpclib/rpclib.git")
url="http://rpclib.net/"
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${srcdir}/${_name}/build"
  cd "${srcdir}/${_name}/build"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr"

  make
}

package() {
  cd "${srcdir}/${_name}/build"
  make DESTDIR="${pkgdir}/" install
}
