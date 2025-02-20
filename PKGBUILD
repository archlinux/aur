# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=tile-world2
pkgver=2.3.0
pkgrel=1
pkgdesc="Emulation of the game Chip's Challenge"
arch=('x86_64')
url="https://tw2.bitbusters.club/"
license=('GPL-2.0-or-later')
provides=('tworld2')
depends=('sdl2')
makedepends=('qt6-base' 'cmake')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/SicklySilverMoon/tworld/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
sha256sums=('49cf69efce8387be6ef75133f5a8c20e712c1cd808e3c9fd1d4a8ba39f03f313'
            '8e0f7b17a93a45707975c801359b367828278fc3d71c028f4edaa44ed15d0c95'
            '880355404ab6940e46621d075ba256c547fba2afe7be28b39f8e1694d33f948b')

prepare() {
  cd "${srcdir}/tworld-${pkgver}"
  sed -i 's/share\/tworld/share\/tworld2/' CMakeLists.txt
}

build() {
  cd "${srcdir}/tworld-${pkgver}"
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Relase -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/" ..
  cmake --build .
}
  
package() {
  cd "${srcdir}/tworld-${pkgver}/build"
  make install
  install -DTm644 ${startdir}/${pkgname}.png     "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -DTm644 ${startdir}/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
