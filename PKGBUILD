# Maintainer Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=freeorion
pkgver=0.4.10.1
pkgrel=1
pkgdesc='A free, Open Source, turn-based space empire and galactic conquest computer game'
url='https://www.freeorion.org'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('boost-libs'
         'python'
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
sha256sums=('ce53307f25c82efaa52b5ea98934648e76b9fa3de5fffbf012bda7cf97bf3168')

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
