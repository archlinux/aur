# Maintainer Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=freeorion
pkgver=0.4.9
pkgrel=5
pkgdesc='FreeOrion is a free, Open Source, turn-based space empire and galactic conquest computer game'
url='https://www.freeorion.org'
arch=('i686' 'x86_64')
license=('GPL-2.0')
depends=('boost-libs'
         'python2'
         'sdl2'
         'libvorbis'
         'glew'
         'openal'
         'hicolor-icon-theme'
         'freetype2')
makedepends=('boost' 'cmake')
conflicts=('freeorion-git')
source=("https://github.com/freeorion/freeorion/archive/v${pkgver}.tar.gz")
md5sums=('66e11dfeb836ea04474a8539713737ee')

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