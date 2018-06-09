# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Ondrej Martinak <omartinak@gmail.com>

pkgname=sfml
pkgver=2.5.0
pkgrel=2
pkgdesc='A simple, fast, cross-platform, and object-oriented multimedia API'
arch=('x86_64')
url='http://www.sfml-dev.org/'
license=('zlib')
depends=('libsndfile' 'libxrandr' 'openal' 'glew' 'freetype2' 'libx11')
makedepends=('mesa' 'cmake' 'doxygen' 'systemd')
source=(https://github.com/SFML/SFML/archive/${pkgver}.tar.gz)
sha512sums=('94306dcbed7d68bb7e226cd91e25950a07bcf393988c4bb79f9de3555c18c78cae4573e911235f712e711a7c02a614bf370df32b8d85240d2f08142327e05076')

build() {
  cd SFML-${pkgver}

  mkdir build && cd build
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -SFML_USE_SYSTEM_DEPS=ON \
      -DSFML_BUILD_EXAMPLES=1 \
      -DSFML_BUILD_DOC=1 \
      -DSFML_INSTALL_PKGCONFIG_FILES=1
  make
  make doc
}

package() {
  cd SFML-${pkgver}/build

  make DESTDIR="$pkgdir/" install

  install -Dm644 ../license.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

