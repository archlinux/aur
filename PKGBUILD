# Maintainer: DingYuan Zhang <justforlxz@gmail.com>
# Contributor: DingYuan Zhang <justforlxz@gmail.com>

pkgname=deepin-dock-git
pkgver=5.3.0.3.r0.g0fb8fbc5
_commit=0fb8fbc5390b6bb518bbb92abebe8c4152c87697
pkgrel=1
pkgdesc='Deepin desktop-environment - dock module'
arch=('x86_64')
url="https://github.com/linuxdeepin/dde-dock"
license=('GPL3')
depends=('qt5-svg' 'deepin-menu' 'deepin-daemon' 'deepin-launcher' 'deepin-qt5integration'
         'deepin-qt-dbus-factory' 'deepin-network-utils' 'libdbusmenu-qt5')
makedepends=('git' 'cmake' 'ninja' 'qt5-tools')
conflicts=('deepin-dock')
replaces=('deepin-dock')
provides=('deepin-dock')
groups=('deepin')
source=("git://github.com/linuxdeepin/dde-dock.git")
sha512sums=('SKIP')

pkgver() {
    cd dde-dock
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd dde-dock
  cmake . -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DDOCK_TRAY_USE_NATIVE_POPUP=YES
  ninja
}

package() {
  cd dde-dock
  DESTDIR="$pkgdir" ninja install
}
