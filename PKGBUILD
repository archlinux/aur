# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Harley Laue <losinggeneration@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Anton Shestakov <engoredi@ya.ru>
# Contributor: Tiago Camargo <tcamargo@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=yabause-qt
pkgver=0.9.13
pkgrel=2
pkgdesc='A Sega Saturn emulator'
arch=('i686' 'x86_64')
url="http://yabause.org/"
license=('GPL')
depends=('freeglut' 'openal' 'qt4' 'sdl')
makedepends=('cmake' 'glu')
conflicts=('yabause-gtk')
source=("http://downloads.sourceforge.net/${pkgname%-*}/${pkgname%-*}-${pkgver}.tar.gz" 'rwx.patch')
sha256sums=('3913f9c57bb65912eb22a339ec6f9413e0c00c11105baeae6a165b84ad4d32fb'
            'd29997d3249683081a2687f31e777f917093101d56815d22103aaaf22ac786b1')

prepare() {
  cd ${pkgname%-*}-${pkgver}

  patch -Np1 -i ../rwx.patch
}

build() {
  cd ${pkgname%-*}-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE='Release' -DYAB_{PORTS='qt',{NETWORK,OPTIMIZED_DMA}='ON'}
  make
}

package() {
  cd ${pkgname%-*}-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
