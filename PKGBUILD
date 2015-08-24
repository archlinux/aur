# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=mingw-w64-xorg-util-macros
pkgver=1.19.0
pkgrel=1
pkgdesc="X.Org Autotools macros (mingw-w64)"
arch=(any)
license=('custom')
url="http://xorg.freedesktop.org/"
makedepends=('mingw-w64-configure')
source=(${url}/releases/individual/util/util-macros-${pkgver}.tar.bz2)
sha256sums=('2835b11829ee634e19fa56517b4cfc52ef39acea0cd82e15f68096e27cbed0ba')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd util-macros-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
  
}

package() {
 for _arch in ${_architectures}; do
    cd "${srcdir}/util-macros-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    install -m755 -d "${pkgdir}/usr/${_arch}/lib"
    mv "${pkgdir}/usr/${_arch}/share/pkgconfig" "${pkgdir}/usr/${_arch}/lib/"
  done
} 
