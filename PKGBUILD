# Maintainer: grimi <grimi at poczta dot fm>
# Maintainer: Thomas Nordenmark <t.nordenmark@gmail.com>
# Developer: Travis Nickles <nickles.travis@gmail.com>

pkgname=antimicro
pkgver=2.23
pkgrel=1
pkgdesc="Graphical program used to map keyboard keys and mouse controls to gamepad buttons"
arch=('i686' 'x86_64')
url="https://github.com/AntiMicro/antimicro"
license=('GPL3')
depends=('libxkbcommon-x11' 'libxtst' 'qt5-base' 'sdl2' 'shared-mime-info' 'desktop-file-utils')
makedepends=('cmake' 'gettext' 'itstool' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AntiMicro/${pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('8656ce94a1eac2a0934e62db42e386bc481708bb')



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

