# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=nm-tray
pkgname=$_pkgname-git
pkgver=0.5.1.r16.g16ffa94
pkgrel=1
pkgdesc='Pure Qt NetworkManager front-end residing in panels'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/palinek/nm-tray'
license=('GPL-2.0-only')
depends=('networkmanager-qt')
makedepends=('git' 'cmake' 'qt6-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/palinek/nm-tray.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  cmake -B build -S ${_pkgname} -DCMAKE_INSTALL_PREFIX=/usr -DNM_TRAY_XDG_AUTOSTART_DIR=/etc/xdg/autostart
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
