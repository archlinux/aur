# Maintainer: Donald Carr<sirspudd at gmail dot com>

# set -x

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
_pkgname=fetchdeeznutz
makedepends=('qt6-base' 'libgit2')
pkgname=${_pkgname}-git
provides=(fetchdeeznuts)
conflicts=(fetchdeeznuts)
pkgver=21
pkgrel=1
arch=('any')
url='https://github.com/sirspudd/fetchdeeznuts'
license=('MIT')
source=("git+https://github.com/sirspudd/${_pkgname}")
sha256sums=('SKIP')
options=('!strip')

pkgver () {
  cd "$srcdir/${_pkgname}"

  git rev-list --count HEAD
  #git describe --tags --long | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cmake \
    -B build \
    -D CMAKE_INSTALL_PREFIX='/usr' \
    -S ${_pkgname}

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
