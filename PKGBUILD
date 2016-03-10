# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Harley Laue <losinggeneration@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Anton Shestakov <engoredi@ya.ru>
# Contributor: Tiago Camargo <tcamargo@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=yabause-qt
pkgver=0.9.14
pkgrel=3
pkgdesc='A Sega Saturn emulator'
arch=('i686' 'x86_64')
url="http://yabause.org/"
license=('GPL')
depends=('freeglut' 'openal' 'qt5-base' 'sdl')
makedepends=('cmake' 'glu' 'libxmu')
conflicts=('yabause-gtk')
source=("http://downloads.sourceforge.net/yabause/yabause-${pkgver}.tar.gz"
        'rwx.patch')
sha256sums=('75e6320873ef6f8ec956568bff5a8f3b67500bdf52a7e0aa88e0a554b2dd775a'
            'd29997d3249683081a2687f31e777f917093101d56815d22103aaaf22ac786b1')

prepare() {
  cd yabause-${pkgver}

  patch -Np1 -i ../rwx.patch
}

build() {
  cd yabause-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DYAB_PORTS='qt' \
    -DYAB_NETWORK='ON' \
    -DYAB_OPTIMIZED_DMA='ON'
  make
}

package() {
  cd yabause-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
