# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=sfml2
pkgver=2.6.2
pkgrel=1
pkgdesc='A simple, fast, cross-platform, and object-oriented multimedia API (Version 2)'
arch=('x86_64')
url='http://www.sfml-dev.org/'
license=('zlib')
depends=('libsndfile' 'libxrandr' 'openal' 'glew' 'freetype2' 'libx11' 'libxcursor')
makedepends=('mesa' 'cmake' 'doxygen' 'systemd' 'ninja')
provides=('libsfml-window.so' 'libsfml-network.so' 'libsfml-system.so'
          'libsfml-audio.so' 'libsfml-graphics.so')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/SFML/SFML/archive/${pkgver}.tar.gz)
sha512sums=('d8a8bee3aa9acda4609104c2a9d4a2512e4be6d6e85fd4b24c287c03f60cfb888e669e61bfac4113dae35f0c3492559b65b3453baf38766d8c0223d9ab77aada')

build() {
	
  cmake -B build -S SFML-${pkgver} -G Ninja \
      -DCMAKE_INSTALL_PREFIX=/opt/sfml2 \
      -DSFML_USE_SYSTEM_DEPS=ON \
      -DSFML_BUILD_EXAMPLES=1 \
      -DSFML_BUILD_DOC=1 \
      -DSFML_INSTALL_PKGCONFIG_FILES=1 \
      -DSFML_PKGCONFIG_INSTALL_PREFIX=/usr/lib/pkgconfig/sfml2
  ninja -C build
  ninja -C build doc
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install

  install -Dm644 SFML-${pkgver}/license.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
