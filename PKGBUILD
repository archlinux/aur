# Maintainer: Dingyuan Zhang <justforlxz@gmail.com>
# Contributor: Dingyuan Zhang <justforlxz@gmail.com>

pkgname=deepin-launcher-git
_pkgname=deepin-launcher
pkgver=5.3.0.3.r0.ge217d9b
pkgrel=1
pkgdesc='Deepin desktop-environment - Launcher module'
arch=('x86_64')
url="https://github.com/linuxdeepin/dde-launcher"
license=('GPL3')
depends=('gsettings-qt' 'qt5-svg' 'qt5-x11extras' 'startdde-git' 'deepin-daemon-git' 'deepin-qt-dbus-factory-git' 'xdg-user-dirs')
makedepends=('git' 'cmake' 'ninja' 'qt5-tools')
conflicts=('deepin-launcher')
replaces=('deepin-launcher')
provides=('deepin-launcher')
groups=('deepin-git')
source=("git://github.com/linuxdeepin/dde-launcher.git")
sha512sums=('SKIP')

pkgver() {
    cd dde-launcher
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd dde-launcher
  cmake . -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DWITHOUT_UNINSTALL_APP=
  ninja
}

package() {
  cd dde-launcher
  DESTDIR="$pkgdir" ninja install
}
