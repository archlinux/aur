# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=fluidlite-git
pkgver=r42.7b5f279
pkgrel=1
pkgdesc="A real-time software synthesizer with SF3 support (development version)"
arch=('i686' 'x86_64')
url="https://github.com/divideconcept/FluidLite"
license=('LGPL')
depends=('libvorbis')
makedepends=('git' 'cmake')
conflicts=('fluidsynth')
source=(${pkgname%-*}::"git+https://github.com/divideconcept/FluidLite.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf build
  mkdir build
}

build() {
  cd build
  cmake ../${pkgname%-*} -DCMAKE_INSTALL_PREFIX=/usr \
                         -DCMAKE_BUILD_TYPE=Release \
                         -DFLUIDLITE_BUILD_STATIC=false
  make
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}
