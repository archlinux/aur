# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-launcher-git
_pkgname=piscesde-launcher
pkgver=0.9
pkgrel=1
pkgdesc="piscesDE's full-screen application launcher"
arch=('x86_64')
url="https://github.com/cutefishos/launcher"
license=('GPL')
groups=('piscesde-git')
depends=('piscesde-fishui-git' 'kwindowsystem' 'libpiscesde-git')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "deepin-kwin")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd launcher
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd launcher

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd launcher
  make DESTDIR="$pkgdir" install
}
