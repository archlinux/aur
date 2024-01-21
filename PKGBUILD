# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-dock-git
pkgver=6.0.28.r1.gca4408c66
pkgrel=1
pkgdesc='Deepin desktop-environment - dock module'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-dock"
license=('GPL3')
depends=(
    'qt5-svg'
    'deepin-daemon'
    'libdbusmenu-qt5'
    'dtkcore'
    'dtkwidget'
    'dtkgui'
    'deepin-qt5integration'
    'deepin-qt-dbus-factory'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
    'qt5-tools'
    'gtest'
    'gmock'
    'dtkcommon'
)
conflicts=('deepin-dock')
provides=('deepin-dock')
groups=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/dde-dock")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
