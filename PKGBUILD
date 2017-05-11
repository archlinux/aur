# Maintainer: Tolga HOŞGÖR <fasdfasdas@gmail.com>

_gitname=rapidjson
pkgname=rapidjson-git
pkgver=r1903.67b062b3
pkgrel=1
pkgdesc="Rapidjson is an attempt to create the fastest JSON parser and generator."
arch=('any')
url="https://github.com/miloyip/rapidjson"
license=('GPL')
conflicts=('rapidjson')
provides=('rapidjson')
makedepends=('git' 'cmake')
source=("git+https://github.com/miloyip/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_gitname"
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DRAPIDJSON_HAS_STDSTRING=ON \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_BUILD_TYPE=release \
        ..
    make
}

package() {
    cd "$srcdir/$_gitname/build"
    make DESTDIR="$pkgdir" install
}
