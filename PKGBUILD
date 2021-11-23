# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-calculator-git
_pkgname=cutefish-calculator
pkgver=0.4.r8.g6cce31e
pkgrel=1
pkgdesc="CutefishOS Calculator"
arch=('x86_64')
url="https://github.com/cutefishos/calculator"
license=('GPL')
groups=('cutefish-git')
depends=('fishui-git' 'libcutefish-git')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd calculator
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd calculator

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd calculator
  make DESTDIR="$pkgdir" install
}
