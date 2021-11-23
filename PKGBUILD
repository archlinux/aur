# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-qt-plugins-git
_pkgname=cutefish-qt-plugins
pkgver=0.5.r1.gb60cdd4
pkgrel=1
pkgdesc="Unify Qt application style of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/qt-plugins"
license=('GPL')
groups=('cutefish-git')
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
