# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dtkcommon-git
pkgver=5.6.3.r1.g3781d33
pkgrel=1
pkgdesc='DTK common modules'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtkcommon"
license=('LGPL3')
depends=()
makedepends=('git' 'qt5-tools' 'gtest' 'gmock' 'cmake' 'ninja')
conflicts=('dtkcommon')
providers=('dtkcommon')
groups=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/dtkcommon")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  cmake -B build -GNinja \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DLINUXNAME="archlinux" \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd $pkgname/build
  DESTDIR="$pkgdir" ninja install
}
