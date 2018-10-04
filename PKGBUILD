# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: grimi <grimi at poczta dot fm>
# Contributor: Thomas Nordenmark <t.nordenmark@gmail.com>
# Contributor: Travis Nickles <nickles.travis@gmail.com>

pkgname=antimicro
pkgver=2.24
pkgrel=1
pkgdesc="Graphical program used to map keyboard keys and mouse controls to a gamepad"
arch=("i686" "x86_64")
url="https://github.com/juliagoda/${pkgname}"
license=("GPL3")
depends=("desktop-file-utils" "libxtst" "qt5-base" "sdl2")
makedepends=("cmake" "extra-cmake-modules" "gettext" "itstool" "qt5-tools")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/juliagoda/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=("220edefd7b2f2dadd9f52d8160aae30976d182dd88db7f2a4f751453a1ec85d9"
            "6609845ef9a2a856be141e9c1bbe4c5adf00e1c9a965f46a765f22b3fc4e231d")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "../${pkgname}.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SDL_2=ON \
    -DWITH_XTEST=ON \
    -DWITH_UINPUT=ON \
    -DAPPDATA=ON
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

