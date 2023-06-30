# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Ondrej Martinak <omartinak@gmail.com>

pkgname=sfml
pkgver=2.6.0
pkgrel=3
pkgdesc='A simple, fast, cross-platform, and object-oriented multimedia API'
arch=('x86_64')
url='http://www.sfml-dev.org/'
license=('zlib')
depends=('libsndfile' 'libxrandr' 'openal' 'glew' 'freetype2' 'libx11' 'libxcursor')
makedepends=('mesa' 'cmake' 'doxygen' 'systemd' 'ninja')
provides=('libsfml-window.so' 'libsfml-network.so' 'libsfml-system.so'
          'libsfml-audio.so' 'libsfml-graphics.so')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/SFML/SFML/archive/${pkgver}.tar.gz)
sha512sums=('aac734e8b0e16936c0238ec792c922923545ec6cf06576bc70004fa1920cd05b4c5e56fbc8a77b650bbe6e202adc39df1d30509dbce95778d04338917a38a87a')

build() {
  cmake -B build -S SFML-${pkgver} -G Ninja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DSFML_USE_SYSTEM_DEPS=ON \
      -DSFML_BUILD_EXAMPLES=1 \
      -DSFML_BUILD_DOC=1 \
      -DSFML_INSTALL_PKGCONFIG_FILES=1 \
      -DSFML_PKGCONFIG_INSTALL_PREFIX=/usr/share/pkgconfig
  ninja -C build
  ninja -C build doc
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install

  install -Dm644 SFML-${pkgver}/license.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
