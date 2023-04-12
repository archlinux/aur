# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pugixml-git
pkgver=1.13.r16.ge383ce5
pkgrel=1
pkgdesc="Light-weight, simple and fast XML parser for C++"
arch=('i686' 'x86_64')
url="https://pugixml.org/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("pugixml=$pkgver")
conflicts=('pugixml')
source=("git+https://github.com/zeux/pugixml.git")
sha256sums=('SKIP')


pkgver() {
  cd "pugixml"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "pugixml"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    ./
  make -C "_build"
}

package() {
  cd "pugixml"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/pugixml"
}
