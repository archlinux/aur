# Maintainer: a821
# Contributor: Charlotte Van Petegem <charlotte@vanpetegem.me>

pkgname=taglib-git
pkgver=2.0.2.r6.648f5e58
pkgrel=1
pkgdesc="A Library for reading and editing the meta-data of several popular audio formats"
arch=(x86_64)
url="https://taglib.github.io/"
license=(LGPL-2.1-only MPL-2.0)
depends=(gcc-libs sh zlib)
makedepends=(cmake git utf8cpp)
checkdepends=(cppunit)
source=("git+https://github.com/taglib/taglib.git")
conflicts=('taglib')
provides=('taglib')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/taglib"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cmake -B build -S taglib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON

  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
