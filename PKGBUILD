# Maintainer: Javier Tia <javier.tia at gmail dot com>
# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=libtins
pkgver=3.2
pkgrel=1
pkgdesc="A high-level, multiplatform C++ network packet sniffing and crafting library"
arch=('i686' 'x86_64')
url="http://libtins.github.io/"
license=('BSD')
depends=('libpcap' 'openssl')
makedepends=('cmake')
options=('!libtool')
source=("https://github.com/mfontanini/libtins/archive/v${pkgver}.tar.gz")
md5sums=('f7da307e2a3fb897654983baf2de0ac3')

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

