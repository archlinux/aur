pkgname=vcl-git
pkgver=0+5+g118a3f4
pkgrel=1
pkgdesc="Vala Completion Library"
arch=(i686 x86_64)
url="https://github.com/BZHDeveloper/vala-gobject"
license=(GPL3)
depends=(libgee vala)
makedepends=(git vala meson)
_commit=233ca8aaa3b5f834947e17b077387f403c685302
source=("git://github.com/BZHDeveloper/vala-gobject.git")
md5sums=('SKIP')

pkgver() {
  cd vala-gobject
  _count=$(git rev-list --count HEAD)
  _commit=$(git rev-parse --short HEAD)
  echo 0+$_count+g$_commit
}

build() {
  cd vala-gobject
  [ -d build ] && rm -rf build
  mkdir build
  meson --prefix=/usr build
  ninja -C build
}

package() {
  cd vala-gobject/build
  DESTDIR=${pkgdir} ninja install
}
