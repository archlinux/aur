# Maintainer: DLLCoolJ <archcloudlabs at gmail dot com>
# Maintainer: Javier Tiá <javier.tia at gmail dot com>
pkgname=libtins
pkgver=4.5
pkgrel=1
pkgdesc="A high-level, multiplatform C++ network packet sniffing and crafting library"
arch=('i686' 'x86_64')
url="http://libtins.github.io/"
license=('BSD')
depends=('libpcap' 'openssl' 'boost')
makedepends=('cmake')
options=('!libtool')
source=("https://github.com/mfontanini/libtins/archive/v${pkgver}.tar.gz")
sha256sums=('6ff5fe1ada10daef8538743dccb9c9b3e19d05d028ffdc24838e62ff3fc55841')

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
}
