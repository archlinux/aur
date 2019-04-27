# Maintainer: Charlotte Van Petegem <charlotte@vanpetegem.me>

pkgname=taglib-git
pkgver=v1.11.1.r152.6455671e
pkgrel=2
pkgdesc="A Library for reading and editing the meta-data of several popular audio formats"
arch=(x86_64)
url="https://taglib.github.io/"
license=(LGPL MPL)
depends=(zlib)
makedepends=(cmake boost)
source=("git+https://github.com/taglib/taglib.git")
conflicts=('taglib')
provides=('taglib=1.11.1')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/taglib"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
    mkdir -p build
}

build() {
  cd build
  cmake $srcdir/taglib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DWITH_MP4=ON \
    -DWITH_ASF=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
