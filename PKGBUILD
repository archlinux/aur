# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Ondrej Martinak <omartinak@gmail.com>

pkgname=sfml
pkgver=2.1
pkgrel=1
pkgdesc='A simple, fast, cross-platform, and object-oriented multimedia API'
arch=('i686' 'x86_64')
url='http://www.sfml-dev.org/'
license=('zlib')
depends=('libsndfile' 'libxrandr' 'libjpeg' 'openal' 'glew' 'freetype2')
makedepends=('mesa' 'cmake' 'doxygen')
install=sfml.install
source=("${pkgname}-${pkgver}::https://github.com/LaurentGomila/SFML/archive/${pkgver}.tar.gz")
md5sums=('6457a5903b156390012773e9ef33f65f')

build() {
  cd "$srcdir"/SFML-${pkgver}

  mkdir build && cd build
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DSFML_BUILD_EXAMPLES=true \
      -DSFML_BUILD_DOC=true
  make
  make doc
}

package() {
  cd "$srcdir"/SFML-${pkgver}/build

  make DESTDIR="$pkgdir/" install

  install -Dm644 "$pkgdir/usr/share/SFML/cmake/Modules/FindSFML.cmake" "$pkgdir/usr/share/cmake-2.8/Modules/FindSFML.cmake"

  install -Dm644 ../license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

