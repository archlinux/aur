# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=fishui-git
_pkgname=fishui
pkgver=0.4.r11.g0d327ec
pkgrel=1
pkgdesc="GUI library based on QQC2 for Cutefish applications"
arch=('x86_64')
url="https://github.com/cutefishos/fishui"
license=('GPL')
depends=('kwindowsystem' 'qt5-quickcontrols2')
makedepends=('git' 'extra-cmake-modules' 'ninja' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" ninja install
}
