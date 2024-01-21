# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-network-core-git
_pkgname=dde-network-core
pkgver=2.0.18.r1.g6f086c2
pkgrel=1
pkgdesc='the library of network libdde-network-core module'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-network-core"
license=('GPL3')
depends=(
    'deepin-qt-dbus-factory'
    'gio-qt'
    'gsettings-qt'
    'networkmanager-qt5'
    'deepin-session-shell'
    'deepin-dock'
    'deepin-control-center'
)
makedepends=(
    'qt5-tools'
    'cmake'
    'ninja'
    'gtest'
    'dtkcommon'
)
conflicts=('deepin-network-core' 'deepin-network-utils')
provides=('deepin-network-core' 'deepin-network-utils')
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
