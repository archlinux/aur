# Maintainer: Martin Kröning <martin dot kroening at rwth hyphen aachen dot de>

pkgname=pi2-view
pkgver=0.1
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
_commit=f3f887b3a53ad73919943252785835ebfcaaf694  # tags/0.1^0
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

