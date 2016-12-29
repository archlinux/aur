# Maintainer: Simon Dreher <code[at]simon-dreher[dot]de>
pkgname=alacarte-maps
pkgver=0.4.0
pkgrel=1
pkgdesc="An easy to use, fast and flexible tile renderer and server for OSM data."
url="https://alacarte-maps.github.io"
arch=('x86_64' 'i686')
license=('AGPL3')
depends=('cairo>=1.12.0' 'boost>=1.55' 'libpng')
makedepends=('cmake' 'asciidoc')

source=("https://github.com/alacarte-maps/alacarte/archive/v${pkgver}.tar.gz")
sha256sums=('1df0c919ba9b01688feffe304f022045c28a42c702f505f4196a11f156facd7a')

build() {
  cd "${srcdir}/alacarte-${pkgver}"
  [[ -d build ]] && rm -r build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. -DCMAKE_BUILD_TYPE=Release
  make
  make man
}

package() {
  cd "${srcdir}/alacarte-${pkgver}/build"
  make DESTDIR=${pkgdir} install
  install -D -m644 "${srcdir}/alacarte-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "${srcdir}/alacarte-${pkgver}/data/alacarte-maps.service" "${pkgdir}/usr/lib/systemd/system/alacarte-maps.service"
}

# vim:set ts=2 sw=2 et:
