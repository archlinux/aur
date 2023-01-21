# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname=piscesys-qt-plugins-git
_pkgname=piscesys-qt-plugins
pkgver=0.9
pkgrel=1
pkgdesc="Unify Qt application style of piscesys"
arch=('x86_64')
url="https://gitlab.com/piscesys/qt-plugins"
license=('GPL')
depends=('kwindowsystem' 'libdbusmenu-qt5' 'libqtxdg' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "cutefish-qt-plugins-git")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd qt-plugins
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd qt-plugins

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd qt-plugins
  DESTDIR="$pkgdir" make install
}
