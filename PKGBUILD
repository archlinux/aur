# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-dock-git
_pkgname=cutefish-dock
pkgver=0.4.r34.g74273d6
pkgrel=1
pkgdesc="CutefishOS application dock"
arch=('x86_64')
url="https://github.com/cutefishos/dock"
license=('GPL')
groups=('cutefish-git')
depends=('fishui-git' 'libcutefish-git' 'qt5-svg')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd dock
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd dock

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd dock
  make DESTDIR="$pkgdir" install
}
