# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: grimi <grimi at poczta dot fm>
# Contributor: Thomas Nordenmark <t.nordenmark@gmail.com>
# Contributor: Travis Nickles <nickles.travis@gmail.com>

pkgname=antimicro
pkgver=2.25
pkgrel=1
pkgdesc="Graphical program used to map keyboard keys and mouse controls to a gamepad"
arch=("i686" "x86_64")
url="https://github.com/juliagoda/${pkgname}X"
license=("GPL3")
depends=("desktop-file-utils" "hicolor-icon-theme" "libxtst" "qt5-base" "sdl2")
makedepends=("cmake" "extra-cmake-modules" "gettext" "itstool" "qt5-tools")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/juliagoda/${pkgname}X/archive/${pkgver}.tar.gz")
sha256sums=("349a980addac44414f9e4c5d1f4c58fc15ac48c639cc07c2f3bfb416c79f94fe")

build() {
  cd "${srcdir}/${pkgname}X-${pkgver}"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DUSE_SDL_2=ON \
    -DAPPDATA=ON \
    -DWITH_UINPUT=ON \
    -DWITH_X11=ON \
    -DWITH_XTEST=ON
  make
}

package() {
  cd "${srcdir}/${pkgname}X-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

