# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-session-ui-git
pkgver=6.0.15.r1.g71f345d8
pkgrel=1
pkgdesc='Deepin desktop-environment - Session UI module'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-session-ui"
license=('GPL3')
groups=('deepin')
depends=('gsettings-qt' 'startdde' 'liblightdm-qt5' 'qt5-svg' 'deepin-daemon' 'deepin-dock' 'deepin-wallpapers')
makedepends=('git' 'deepin-gettext-tools' 'cmake' 'ninja' 'gtest' 'gcovr')
provides=('deepin-notifications' 'deepin-session-ui')
conflicts=('dde-workspace' 'deepin-session-ui' 'deepin-notifications')
groups=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/dde-session-ui")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -i 's|/usr/share/backgrounds/default_background.jpg|/usr/share/backgrounds/deepin/desktop.jpg|' widgets/*.cpp
}

build() {
  cd $pkgname
  cmake -B build -GNinja -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd $pkgname/build
  DESTDIR="$pkgdir" ninja install
}
