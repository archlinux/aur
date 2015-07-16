# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Ondrej Martinak <omartinak@gmail.com>

pkgname=sfml
pkgver=2.3.1
pkgrel=1
pkgdesc='A simple, fast, cross-platform, and object-oriented multimedia API'
arch=('i686' 'x86_64')
url='http://www.sfml-dev.org/'
license=('zlib')
depends=('libsndfile' 'libxrandr' 'libjpeg' 'openal' 'glew' 'freetype2' 'xcb-util-image')
makedepends=('mesa' 'cmake' 'doxygen' 'git')
install=sfml.install
source=("git+git://github.com/LaurentGomila/SFML.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir"/SFML

  mkdir build && cd build
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DSFML_BUILD_EXAMPLES=1 \
      -DSFML_BUILD_DOC=1 \
      -DSFML_INSTALL_PKGCONFIG_FILES=1
  make
  make doc
}

package() {
  cd "$srcdir"/SFML/build

  make DESTDIR="$pkgdir/" install

  install -Dm644 "$pkgdir/usr/share/SFML/cmake/Modules/FindSFML.cmake" "$pkgdir/usr/share/cmake-3.2/Modules/FindSFML.cmake"

  install -Dm644 ../license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

