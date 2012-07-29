# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Ondrej Martinak <omartinak@gmail.com>

pkgname=sfml
pkgver=2.0rc1
pkgrel=2
pkgdesc='A simple, fast, cross-platform, and object-oriented multimedia API'
arch=('i686' 'x86_64')
url='http://www.sfml-dev.org/'
license=('zlib')
depends=('libsndfile' 'libxrandr' 'libjpeg' 'openal' 'glew' 'freetype2')
makedepends=('mesa' 'cmake' 'doxygen')
install=sfml.install
source=("2.0-rc.tar.gz::https://github.com/LaurentGomila/SFML/tarball/2.0-rc")
md5sums=('03c8e6817f4525092b94a3d44e8eada8')

build() {
  cd "$srcdir"/Laurent*

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. \
        -DBUILD_DOC=true \
        -DBUILD_EXAMPLES=true
  make
  make doc
}

package() {
  cd "$srcdir"/Laurent*/build

  make DESTDIR="$pkgdir/" install

  install -Dm644 "$pkgdir/usr/share/SFML/cmake/Modules/FindSFML.cmake" "$pkgdir/usr/share/cmake-2.8/Modules/FindSFML.cmake"

  install -Dm644 ../license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  make clean
}

