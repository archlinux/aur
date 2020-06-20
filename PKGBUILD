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
  cd Symphonium
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd Symphonium
  sed -i '22,24 s/^/#/' Symphonium.pro
}

build() {
  cd Symphonium
  qmake PREFIX="/usr"
  make
}

package() {
  cd Symphonium
  make INSTALL_ROOT="${pkgdir}" install
}