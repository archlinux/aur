# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-dock-git
pkgver=5.6.2.r12.g92bb6933e
pkgrel=3
pkgdesc='Deepin desktop-environment - dock module'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-dock"
license=('GPL3')
depends=(
    'qt5-svg'
    'deepin-daemon-git'
    'deepin-qt5integration-git'
    'deepin-qt-dbus-factory-git'
    'libdbusmenu-qt5'
    'dtkcore-git'
    'dtkwidget-git'
    'dtkgui-git'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
    'qt5-tools'
    'gtest'
    'gmock'
    'deepin-qt5integration-git'
    'deepin-qt-dbus-factory'
    'libdbusmenu-qt5'
    'dtkcommon-git'
    'deepin-control-center-git'
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

prepare() {
    cd $pkgname
    if [[ ! -z ${sha} ]];then
      git checkout -b $sha
    fi
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
