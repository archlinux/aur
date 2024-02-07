# Maintainer: Alexandros Theodotou <alex at zrythm dot org>

_name=licensedigger
pkgname="${_name}-git"
pkgver=0.0.1
pkgrel=1
pkgdesc='Tools to convert existing license headers to SPDX compliant headers '
arch=(x86_64)
url='https://invent.kde.org/sdk/licensedigger'
license=(GPL3)
depends=()
makedepends=(cmake extra-cmake-modules)
source=("$_name::git+https://github.com/KDE/licensedigger#branch=master")
sha256sums=('SKIP')

# TODO
#pkgver() {
  #cd $_name
  #git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
#}

prepare() {
  cd "${_name}"
  mkdir -vp build
}

build() {
  cd "${_name}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${_name}/build"
  make DESTDIR="$pkgdir" install
}
