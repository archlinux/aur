# Maintainer Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=freeorion
pkgver=0.4.9
pkgrel=3
pkgdesc='Turn-based space empire and galactic conquest (4X) computer game'
url='http://www.freeorion.org/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('boost-libs' 'python2' 'sdl2' 'libvorbis' 'glew' 'openal' 'hicolor-icon-theme' 'freetype2')
makedepends=('boost' 'cmake')
provides=('freeorion')
conflicts=('freeorion-git')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('66e11dfeb836ea04474a8539713737ee')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
  cd "${srcdir}/${pkgname}-${pkgver}"/build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"/build
  make DESTDIR="${pkgdir}" install
}