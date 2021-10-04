# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-launcher-git
_pkgname=cutefish-launcher
pkgver=0.4.r30.ga0c5630
pkgrel=1
pkgdesc="CutefishOS's full-screen application launcher"
arch=('x86_64')
url="https://github.com/cutefishos/launcher"
license=('GPL')
groups=('cutefish-git')
depends=('fishui-git' 'kwindowsystem' 'libcutefish-git')
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
