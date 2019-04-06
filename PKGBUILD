# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pugixml-git
pkgver=1.9.r55.g7247a82
pkgrel=1
pkgdesc="Light-weight, simple and fast XML parser for C++"
arch=('i686' 'x86_64')
url="https://pugixml.org/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('pugixml')
conflicts=('pugixml')
source=("git+https://github.com/zeux/pugixml.git")
sha256sums=('SKIP')


pkgver() {
  cd "pugixml"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "pugixml"

  mkdir -p "_build" && cd "_build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    ../
  make
}

package() {
  cd "pugixml"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/pugixml/LICENSE.md"
}
