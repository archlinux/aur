# Maintainer Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=freeorion
pkgver=0.4.9
pkgrel=5
pkgdesc='A free, Open Source, turn-based space empire and galactic conquest computer game'
url='https://www.freeorion.org'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('boost-libs'
         'python2'
         'sdl2'
         'libvorbis'
         'glew'
         'openal'
         'hicolor-icon-theme'
         'freetype2')
makedepends=('boost' 'cmake')
conflicts=('freeorion-git' 'freeorion-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/freeorion/freeorion/archive/v${pkgver}.tar.gz")
sha256sums=('bf16ecfe73e5f14f2fba0e4d30f10111051ec88806f97361ab3f4e1fdac1f512')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"/build
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"/build
  make DESTDIR="${pkgdir}" install
}