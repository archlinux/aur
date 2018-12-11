# Maintainer: Javier Tiá <javier.tia at gmail dot com>

pkgname=libtins
pkgver=4.1
pkgrel=1
pkgdesc="A high-level, multiplatform C++ network packet sniffing and crafting library"
arch=('i686' 'x86_64')
url="http://libtins.github.io/"
license=('BSD')
depends=('libpcap' 'openssl' 'boost')
makedepends=('cmake')
options=('!libtool')
source=("https://github.com/mfontanini/libtins/archive/v${pkgver}.tar.gz")
sha256sums=('81a0ae1e04499b25984b2833579d33c4a78ff4513e9a14176c574e855163f7a5')

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

# vim:set ts=2 sw=2 et:
