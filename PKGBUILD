# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dtk6log-git
_pkgname=dtk6log
pkgver=0.0.1.r0.g7111763
pkgrel=1
pkgdesc='Deepin Toolkit, log module for DDE look and feel'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtk6log"
license=('LGPL3')
depends=('libsystemd' 'qt6-base' 'spdlog')
makedepends=('git' 'ninja' 'cmake' 'pkg-config')
conflicts=('dtk6log')
provides=('dtk6log')
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/dtk6log.git")
sha512sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  cmake -B build -GNinja \
    -DNOTPACKAGE=OFF \
    -DMKSPECS_INSTALL_DIR=lib/qt6/mkspecs/modules/ \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_SYSTEMD=ON \
    -DBUILD_WITH_QT6=ON \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd $srcdir/$_pkgname/build
  DESTDIR="$pkgdir" ninja install
}
