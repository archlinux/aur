# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dwayland-git
pkgver=5.24.3.deepin.1.4.r1.gf339073
pkgrel=1
pkgdesc='Qt-style Client and Server library wrapper for the Wayland libraries'
arch=(x86_64)
license=(LGPL)
depends=(qt5-wayland)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc wayland-protocols deepin-wayland-protocols-git ninja)
provides=('dwayland-reborn' 'dwayland')
conflicts=('dwayland-reborn' 'dwayland')
source=("$pkgname::git+https://github.com/linuxdeepin/dwayland.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -G Ninja -B build -S $pkgname \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

