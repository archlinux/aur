# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Ondrej Martinak <omartinak@gmail.com>

pkgname=sfml
pkgver=2.5.1
pkgrel=3
pkgdesc='A simple, fast, cross-platform, and object-oriented multimedia API'
arch=('x86_64')
url='http://www.sfml-dev.org/'
license=('zlib')
depends=('libsndfile' 'libxrandr' 'openal' 'glew' 'freetype2' 'libx11')
makedepends=('mesa' 'cmake' 'doxygen' 'systemd')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/SFML/SFML/archive/${pkgver}.tar.gz)
sha512sums=('7aed2fc29d1da98e6c4d598d5c86cf536cb4eb5c2079cdc23bb8e502288833c052579dadbe0ce13ad6461792d959bf6d9660229f54c54cf90a541c88c6b03d59')

build() {
  cd SFML-${pkgver}

  mkdir build && cd build
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DSFML_USE_SYSTEM_DEPS=ON \
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
