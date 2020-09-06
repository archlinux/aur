# Maintainer: DingYuan Zhang <justforlxz@gmail.com>
# Contributor: DingYuan Zhang <justforlxz@gmail.com>

pkgname=deepin-dock-git
pkgver=5.1.0.11.r353.g0a4c6101
pkgrel=1
pkgdesc='Deepin desktop-environment - dock module'
arch=('x86_64')
url="https://github.com/linuxdeepin/dde-dock"
license=('GPL3')
depends=('qt5-svg' 'deepin-daemon-git' 'deepin-qt5integration-git'
         'deepin-qt-dbus-factory-git' 'deepin-network-utils-git' 'libdbusmenu-qt5')
makedepends=('git' 'cmake' 'ninja' 'qt5-tools' 'deepin-qt5integration-git' 'deepin-qt-dbus-factory' 'deepin-network-utils-git')
conflicts=('deepin-dock')
replaces=('deepin-dock')
provides=('deepin-dock')
groups=('deepin-git')
source=("$pkgname::git://github.com/linuxdeepin/dde-dock"
        "dde-dock.patch")
sha512sums=('SKIP' 'SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  patch -p1 -i ../dde-dock.patch
}

build() {
  cd $pkgname
  cmake . -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DDOCK_TRAY_USE_NATIVE_POPUP=YES
  ninja
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}
