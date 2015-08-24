# Maintainer: Thomas Nordenmark <t.nordenmark@gmail.com>
# Developer: Travis Nickles <nickles.travis@gmail.com>

pkgname=antimicro
pkgver=2.18.1
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
md5sums=('ad96ac8720d659e0db513d721633fa6e')
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
