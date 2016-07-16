# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=quickpaper-git
pkgver=1.0.0.r12.040fcbb
pkgrel=1
pkgdesc="A set of QtQuick components extending QtQuick.Controls for building applications specifically designed with Material Design"
arch=('i686' 'x86_64')
url="https://github.com/iBeliever/quickpaper/"
license=('MPL2')
depends=('qt5-declarative>=5.7.0')
makedepends=('git')
conflicts=('quickpaper')
provides=('quickpaper')
source=("git://github.com/iBeliever/quickpaper.git")
sha512sums=('SKIP')

pkgver() {
  cd quickpaper
  echo "1.0.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  sed -i 's/ tests//' quickpaper/quickpaper.pro
  sed -i 's/material qmldir/material/' quickpaper/src/src.pro
  sed -i 's/# //' quickpaper/src/qmldir
  cd build
  qmake ../quickpaper
  make
}

package() {
  cd build
  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 ../quickpaper/LICENSE ${pkgdir}/usr/share/licenses/quickpaper/LICENSE
}
