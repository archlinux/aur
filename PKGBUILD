# Maintainer: DLLCoolJ <archcloudlabs at gmail dot com>
# Maintainer: Javier Tiá <javier.tia at gmail dot com>
pkgname=libtins
pkgver=git
pkgrel=1
pkgdesc="A high-level, multiplatform C++ network packet sniffing and crafting library"
arch=('i686' 'x86_64')
url="http://libtins.github.io/"
license=('BSD')
depends=('libpcap' 'openssl' 'boost')
makedepends=('cmake' 'git')
options=('!libtool')
source=("libtins::git+https://github.com/mfontanini/libtins")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/libtins"
  mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D LIBTINS_ENABLE_CXX11=yes ../
  make
}

package() {
  cd "${srcdir}/libtins/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
