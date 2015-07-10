# Maintainer: Travis Nickles <nickles.travis@gmail.com>
# Contributor: Travis Nickles <nickles.travis@gmail.com>

pkgname=antimicro
pkgver=2.15
pkgrel=1
pkgdesc="Graphical program used to map keyboard keys and mouse controls to gamepad buttons"
arch=('i686' 'x86_64')
url="https://github.com/Ryochan7/antimicro"
license=('GPL3')
groups=()
depends=('libxkbcommon-x11' 'libxtst' 'qt5-base' 'sdl2')
makedepends=('cmake' 'gettext' 'itstool' 'qt5-tools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="${pkgname}.install"
source=("https://github.com/Ryochan7/antimicro/archive/${pkgver}.tar.gz")
md5sums=('64ff301e3c0fb9121477c440a1ea936d')
noextract=()

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SDL_2=ON -DWITH_XTEST=ON \
    -DWITH_UINPUT=ON -DAPPDATA=ON ..
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  
  make DESTDIR="${pkgdir}" install
}
