# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-fishui-git
pkgbase=piscesde-fishui-git
_pkgname=piscesde-fishui
pkgver=0.9
pkgrel=1
pkgdesc="GUI library based on QQC2 for piscesDE applications"
arch=('x86_64')
url="https://github.com/piscesys/fishui"
license=('GPL')
depends=('kwindowsystem' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols2')
makedepends=('git' 'extra-cmake-modules' 'ninja' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd fishui
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd fishui

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd fishui
  DESTDIR="$pkgdir" ninja install
}
