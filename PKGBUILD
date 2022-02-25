# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-session-shell-git
pkgver=5.5.9.r123.gd52f772
pkgrel=1
pkgdesc='Deepin desktop-environment - session-shell module'
arch=('aarch64')
url="https://github.com/linuxdeepin/dde-session-shell"
license=('GPL3')
depends=('deepin-daemon-git' 'deepin-wallpapers-git' 'gsettings-qt' 'liblightdm-qt5' 'startdde-git')
makedepends=('git' 'cmake' 'ninja' 'qt5-tools' 'gtest' 'gmock')
conflicts=('deepin-session-ui<5' 'deepin-session-shell')
provides=('lightdm-deepin-greeter' 'deepin-session-shell')
groups=('deepin-git')
source=("$pkgname::git://github.com/linuxdeepin/dde-session-shell")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -i 's/5\.5//g' CMakeLists.txt tests/lightdm-deepin-greeter/CMakeLists.txt tests/dde-lock/CMakeLists.txt
}

build() {
  cd $pkgname
  cmake . -GNinja -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install

  chmod +x "$pkgdir"/usr/bin/deepin-greeter
}
