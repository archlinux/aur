# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dtkcommon-git
_pkgname=dtkcommon
pkgver=5.6.3.r1.g3781d33
pkgrel=4
pkgdesc='DTK common modules'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtkcommon"
license=('LGPL3')
depends=()
makedepends=('git' 'qt5-tools' 'gtest' 'gmock' 'cmake' 'ninja')
conflicts=('dtkcommon')
provides=('dtkcommon')
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/dtkcommon")
sha512sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  cmake -B build -GNinja \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DMKSPECS_INSTALL_DIR=/usr/lib/qt/mkspecs/ \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd $srcdir/$_pkgname/build
  DESTDIR="$pkgdir" ninja install
}
