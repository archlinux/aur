# Maintainer: Javier Tiá <javier.tia at gmail dot com>

pkgname=libtins
pkgver=3.5
pkgrel=2
pkgdesc="A high-level, multiplatform C++ network packet sniffing and crafting library"
arch=('i686' 'x86_64')
url="http://libtins.github.io/"
license=('BSD')
depends=('libpcap' 'openssl' 'boost')
makedepends=('cmake')
options=('!libtool')
source=("https://github.com/mfontanini/libtins/archive/v${pkgver}.tar.gz")
sha256sums=('1b0624b2eea3ce077a86f3abd3e625661760c4cfd21cd8f3d3cd3622229ff2cd')

build() {
  cd "${srcdir}/libtins-${pkgver}"
  mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D LIBTINS_ENABLE_CXX11=yes ../
  make
}

package() {
  cd "${srcdir}/libtins-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -R "${pkgdir}/usr/CMake/"
}

# vim:set ft=sh ts=2 sw=2 et:
