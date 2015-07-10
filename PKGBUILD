# Contributor: grimi <grimi at poczta dot fm>

_pkgname=antimicro
pkgname=${_pkgname}-qt4
pkgver=2.15
pkgrel=1
pkgdesc="Graphical program used to map keyboard keys and mouse controls to gamepad buttons (QT4 version)"
arch=('i686' 'x86_64')
url="https://github.com/Ryochan7/antimicro"
license=('GPL3')
depends=('libxtst' 'qt4' 'sdl2' 'shared-mime-info')
makedepends=('cmake' 'itstool')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
install="${pkgname}.install"
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Ryochan7/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('64ff301e3c0fb9121477c440a1ea936d')


build() {
   cd ${_pkgname}-${pkgver}
   mkdir -p build && cd build
   QT_SELECT=4 cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SDL_2=ON \
      -DWITH_UINPUT=ON -DWITH_XTEST=ON -DAPPDATA=ON ..
   make
}

package() {
   cd ${_pkgname}-${pkgver}/build
   make DESTDIR="${pkgdir}" install
}

# vim:set ts=3 sw=3 sts=3 et:

