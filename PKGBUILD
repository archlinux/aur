# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Harley Laue <losinggeneration@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Anton Shestakov <engoredi@ya.ru>
# Contributor: Tiago Camargo <tcamargo@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=yabause-qt
pkgver=0.9.12
pkgrel=1
pkgdesc='A Sega Saturn emulator'
arch=('i686' 'x86_64')
url="http://yabause.org/"
license=('GPL')
depends=('freeglut' 'mesa' 'openal' 'qt4' 'sdl')
makedepends=('cmake' 'glu')
conflicts=('yabause-gtk')
source=("http://downloads.sourceforge.net/${pkgname%-*}/${pkgname%-*}-${pkgver}.tar.gz" 'rwx.patch')
sha256sums=('f45c9649c379e1e790856f8dfa37d93be5638e8f697319b241951316f817bfb1'
            'd29997d3249683081a2687f31e777f917093101d56815d22103aaaf22ac786b1')

build() {
  cd "${srcdir}"/${pkgname%-*}-${pkgver}

# Patch
  patch -Np1 -i "${srcdir}"/rwx.patch

# Build
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DYAB_PORTS=qt -DYAB_NETWORK=ON -DYAB_OPTIMIZED_DMA=on -DYAB_PERKEYNAME=ON
  make
}

package() {
  cd "${srcdir}"/${pkgname%-*}-${pkgver}/build

# Install
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
