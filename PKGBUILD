# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=nm-tray
pkgname=$_pkgname-git
pkgver=0.5.0.r8.gfa1e7a8
pkgrel=1
pkgdesc='Pure Qt NetworkManager front-end residing in panels'
arch=('i686' 'x86_64')
url='https://github.com/palinek/nm-tray'
license=('GPL')
depends=('networkmanager-qt5')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/palinek/nm-tray.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  mkdir -p build
  cd build
  cmake $srcdir/$_pkgname -DCMAKE_INSTALL_PREFIX=/usr -DNM_TRAY_XDG_AUTOSTART_DIR=/etc/xdg/autostart
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
