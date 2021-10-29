# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dtkcore-git
pkgver=5.5.17.1.r17.g90bc4ae
pkgrel=1
pkgdesc='DTK core modules'
arch=('x86_64')
url="https://github.com/linuxdeepin/dtkcore"
license=('LGPL3')
depends=('dconf' 'deepin-desktop-base-git' 'python' 'gsettings-qt' 'lshw')
makedepends=('git' 'qt5-tools' 'gtest' 'dtkcommon-git')
conflicts=('dtkcore')
provides=('dtkcore')
groups=('deepin-git')
source=("$pkgname::git://github.com/linuxdeepin/dtkcore.git"
        "fix-ut.patch"
       )
sha512sums=('SKIP'
            '1ace18326ddd5fd14bf652b21db9ee9f706f1dae63f23e9712e7d9142487bff43e1464d2d5bf46e2cfec6663e3153629749ec5e99c1b5e9e785071d6fa9301b2')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  patch -p1 -i ../fix-ut.patch
}

build() {
  cd $pkgname
  qmake-qt5 PREFIX=/usr DTK_VERSION=$pkgver LIB_INSTALL_DIR=/usr/lib
  make
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir" install
}
