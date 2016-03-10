# Maintainer: Javier Tiá <javier.tia at gmail dot com>

pkgname=libtins
pkgver=3.4
pkgrel=1
pkgdesc="A high-level, multiplatform C++ network packet sniffing and crafting library"
arch=('i686' 'x86_64')
url="http://libtins.github.io/"
license=('BSD')
depends=('libpcap' 'openssl')
makedepends=('cmake')
options=('!libtool')
source=("https://github.com/mfontanini/libtins/archive/v${pkgver}.tar.gz")
sha256sums=('b94935b5fb40668ce5acb87d4f26970b47bfa25ba5f34aeaab70d8a422a9b192')

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
