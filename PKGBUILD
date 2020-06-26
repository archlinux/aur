# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=symphonium-git
pkgver=r20.605da36
pkgrel=1
pkgdesc='A tool to help learning the piano'
arch=('i686' 'x86_64')
url='https://symphonium.net'
license=('GPL3')
provides=('symphonium')
depends=('hicolor-icon-theme'
         'qt5-base'
         'timidity++')
makedepends=('qt5-base')
source=("symphonium::git+https://github.com/ttdm/Symphonium")
sha256sums=('SKIP')

pkgver() {
  cd symphonium
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd symphonium
  sed -i '22,24 s/^/#/' Symphonium.pro
  sed -i "7a#include <QPainterPath>" displayarea.cpp
}

build() {
  cd symphonium
  qmake PREFIX="/usr"
  make
}

package() {
  cd symphonium
  make INSTALL_ROOT="${pkgdir}" install
}