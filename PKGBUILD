# Maintainer: endlesseden <eden@rose.place>

_pkgbase=fast_float
pkgname=$_pkgbase-git
pkgver=3.4.0.r17.gcfb44c2
pkgrel=1
arch=(any)
url="https://github.com/fastfloat/fast_float/"
license=('MIT' 'Apache-2.0')
pkgdesc='Fast and exact implementation of the C++ from_chars functions:4x faster than strtod'
makedepends=(cmake git)
conflicts=($_pkgbase)
provides=($_pkgbase)
source=($_pkgbase::git+https://github.com/fastfloat/fast_float.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd $_pkgbase

  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" 

  make
}

package() {
  cd $_pkgbase/build
  make DESTDIR="$pkgdir" install
}
