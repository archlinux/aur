# Maintainer Jens Staal <staal1978@gmial.com>
# adopted from official xcb-proto package:
# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=mingw-w64-xcb-proto
pkgver=1.11
pkgrel=1
pkgdesc="XML-XCB protocol descriptions (mingw-w64)"
arch=(any)
url="http://xcb.freedesktop.org/"
license=('custom')
makedepends=('python' 'libxml2')
source=($url/dist/xcb-proto-$pkgver.tar.bz2)
sha256sums=('b4aceee6502a0ce45fc39b33c541a2df4715d00b72e660ebe8c5bb444771e32e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32" 

build() {
  cd xcb-proto-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make 
    popd 
  done
}

package() {
  cd xcb-proto-$pkgver
  for _arch in ${_architectures}; do
    cd "${srcdir}/xcb-proto-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
  done
}
