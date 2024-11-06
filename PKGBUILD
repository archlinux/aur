# Maintainer: Adrian Holfter < aholfter PLUS aur AT googlemail DOT com >
pkgname=laslib-git
pkgver=2.0.3.r95.g11ae4c9
pkgrel=1
pkgdesc='C++ programming API for reading / writing LIDAR data stored in standard LAS format'
arch=('x86_64')
url='https://lastools.org/'
license=('LGPL')
provides=('laslib')
conflicts=('laslib')
makedepends=('cmake' 'git')
depends=('gcc-libs')

source=('git+https://github.com/LAStools/LAStools.git')
sha256sums=('SKIP')

pkgver() {
    cd LAStools
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake \
    -B build \
    -S LAStools \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Remove binaries that are part of LAStools - if you need them, install lastools-git.
  rm -rf "${pkgdir}/usr/bin"
}
