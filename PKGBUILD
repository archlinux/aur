# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dtklog-git
_pkgname=dtklog
pkgver=0.0.1.r0.ge651632
pkgrel=1
pkgdesc='Deepin Toolkit, log module for DDE look and feel'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtklog"
license=('LGPL3')
depends=('libsystemd' 'spdlog')
makedepends=('git' 'qt5-tools' 'ninja' 'cmake')
conflicts=('dtklog')
provides=('dtklog')
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/dtklog.git")
sha512sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  cmake -B build -GNinja \
    -DNOTPACKAGE=OFF \
    -DMKSPECS_INSTALL_DIR=lib/qt/mkspecs/modules/ \
    -DBUILD_DOCS=ON \
    -DQCH_INSTALL_DESTINATION=share/doc/qt \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_SYSTEMD=ON \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd $srcdir/$_pkgname/build
  DESTDIR="$pkgdir" ninja install
}
