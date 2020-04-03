# Maintainer: librewish <librewish@gmail.com>

_pkgname=organizer
pkgname=lxqt-organizer-git
pkgver=r89.a278404
pkgrel=1
pkgdesc="LxQt personal information manager"
arch=("i686" "x86_64")
url="https://lxqt.org"
license=("GPL2")
depends=('liblxqt-git' 'qt5-multimedia')
makedepends=('git' 'cmake' 'qt5-tools' 'lxqt-build-tools-git')
provides=('lxqt-organizer')
conflicts=("lxqt-organizer")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
      cd $_pkgname
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    "$srcdir/$_pkgname"

  make
}

package() {
  cd build

  make DESTDIR="$pkgdir" install
}
