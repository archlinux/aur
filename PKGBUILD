# Maintainer: grimi <grimi at poczta dot fm>
# Maintainer: Thomas Nordenmark <t.nordenmark@gmail.com>
# Developer: Travis Nickles <nickles.travis@gmail.com>

pkgname=antimicro
pkgver=2.22
pkgrel=2
pkgdesc="Graphical program used to map keyboard keys and mouse controls to gamepad buttons"
arch=('i686' 'x86_64')
url="https://github.com/AntiMicro/antimicro"
license=('GPL3')
depends=('libxkbcommon-x11' 'libxtst' 'qt5-base' 'sdl2' 'shared-mime-info' 'desktop-file-utils')
makedepends=('cmake' 'gettext' 'itstool' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AntiMicro/${pkgname}/archive/${pkgver}.tar.gz" "sdl_check_ev.patch")
sha1sums=('b30cd898218d3325ff7f18fd2efee2a88a79a5ea'
          '068047dad992f99e70aedceb0a4587ac6735412d')


prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../sdl_check_ev.patch
}


build() {
  cd ${pkgname}-${pkgver}

  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SDL_2=ON -DWITH_XTEST=ON \
      -DWITH_UINPUT=ON -DAPPDATA=ON ..
  make
}

package() {
  cd ${pkgname}-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

