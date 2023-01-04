# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-network-core-git
_pkgname=dde-network-core
pkgver=1.1.8.r7.g09c04e9
pkgrel=1
pkgdesc='the library of network libdde-network-core module'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-network-core"
license=('GPL3')
depends=(
    'deepin-qt-dbus-factory-git'
    'gio-qt'
    'gsettings-qt'
    'networkmanager-qt'
    'deepin-session-shell-git'
)
makedepends=(
    'qt5-tools'
    'cmake'
    'ninja'
    'gtest'
    'dtkcommon-git'
    'deepin-dock-git'
    'deepin-control-center-git'
)
conflicts=('deepin-network-core' 'deepin-network-utils-git')
provides=('deepin-network-core' 'deepin-network-utils-git')
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/dde-network-core")
sha512sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  cmake -B build -GNinja -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd $srcdir/$_pkgname
  DESTDIR="$pkgdir" ninja -C build install
}
