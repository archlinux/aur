# Maintainer: Thomas Nordenmark <t.nordenmark@gmail.com>
# Developer: Travis Nickles <nickles.travis@gmail.com>

pkgname=antimicro
pkgver=2.21
pkgrel=1
pkgdesc="Graphical program used to map keyboard keys and mouse controls to gamepad buttons"
arch=('i686' 'x86_64')
url="https://github.com/Ryochan7/antimicro"
license=('GPL3')
depends=('libxkbcommon-x11' 'libxtst' 'qt5-base' 'sdl2')
makedepends=('cmake' 'gettext' 'itstool' 'qt5-tools')
install="${pkgname}.install"
#source=("${pkgname}-${pkgver}.tar.gz::ttps://github.com/Ryochan7/${pkgname}/archive/${pkgver}.tar.gz")
source=("http://pkgs.fedoraproject.org/lookaside/pkgs/${pkgname}/${pkgname}-${pkgver}.tar.gz/2064888967031e847c255efef941b45e/${pkgname}-${pkgver}.tar.gz")
md5sums=('2064888967031e847c255efef941b45e')

build() {
  #cd ${pkgname}-${pkgver}
  cd ${pkgname}-*/

  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SDL_2=ON -DWITH_XTEST=ON \
      -DWITH_UINPUT=ON -DAPPDATA=ON ..
  make
}

package() {
  #cd ${pkgname}-${pkgver}/build
  cd ${pkgname}-*/build/

  make DESTDIR="${pkgdir}" install
}

