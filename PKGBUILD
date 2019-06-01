# Maintainer: Martin Kröning <martin dot kroening at rwth hyphen aachen dot de>

pkgname=pi2-view
pkgver=0.2
pkgrel=1
pkgdesc="The GUI library for showing the Map of the Praktikum Informatik 2"
arch=('x86_64')
url="https://git.rwth-aachen.de/pi2/pi2-view"
license=("LGPL3")
depends=("boost-libs"
         "cairomm"
         "gtkmm3")
makedepends=("boost"
             "meson"
             "git")
options=('staticlibs' 'strip')
_commit=d3549d28ad2ba7bc9ca2a3d6ab6012ee86475245  # tags/0.2^0
source=("git+https://git.rwth-aachen.de/pi2/$pkgname.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  meson \
    --prefix=/usr \
    --buildtype=plain \
    --unity on \
    build
  ninja -v -C build
}

package() {
  cd "$pkgname"

  DESTDIR="$pkgdir/" ninja -C build install
}

