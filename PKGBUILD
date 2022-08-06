# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-qt-plugins-git
_pkgname=piscesde-qt-plugins
pkgver=0.9
pkgrel=1
pkgdesc="Unify Qt application style of piscesDE"
arch=('x86_64')
url="https://github.com/piscesys/qt-plugins"
license=('GPL')
groups=('piscesde-git')
depends=('kwindowsystem' 'libdbusmenu-qt5' 'libqtxdg' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd qt-plugins
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd qt-plugins

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd qt-plugins
  DESTDIR="$pkgdir" ninja install
}
