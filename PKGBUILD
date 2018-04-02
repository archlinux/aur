# Maintainer: grimi <grimi at poczta dot fm>
# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Thomas Nordenmark <t.nordenmark@gmail.com>
# Developer: Travis Nickles <nickles.travis@gmail.com>

pkgname=antimicro
pkgver=2.23
pkgrel=3
pkgdesc="Graphical program used to map keyboard keys and mouse controls to a gamepad"
arch=("i686" "x86_64")
url="https://github.com/AntiMicro/${pkgname}"
license=("GPL3")
depends=("libxtst" "qt5-base" "sdl2")
makedepends=("cmake" "gettext" "itstool" "qt5-tools")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AntiMicro/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("ef309170612da805992f9194f1973bf38a3174a0856856afedab67f9d927a9ef")

prepare() {
  #Using fix suggested by rakuco by deleting lines with QT5_WRAP_CPP
  #https://github.com/AntiMicro/antimicro/pull/207/files
  sed -i "/QT5_WRAP_CPP/d" "${pkgname}-${pkgver}/CMakeLists.txt"
}

build() {
  mkdir -p "${pkgname}-${pkgver}/build"
  cd "${pkgname}-${pkgver}/build"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SDL_2=ON \
    -DWITH_XTEST=ON \
    -DWITH_UINPUT=ON \
    -DAPPDATA=ON
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}

