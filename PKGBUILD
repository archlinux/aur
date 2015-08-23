# $Id$
# Maintainer Jens Staal <staal1978@gmail.com>
# adopted from official xproto package:
# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=mingw-w64-xproto
pkgver=7.0.28
pkgrel=1
pkgdesc="X11 core wire protocol and auxiliary headers (mingw-w64)"
arch=(any)
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('mingw-w64-crt')
makedepends=('xorg-util-macros' 'mingw-w64-gcc' 'mingw-w64-configure')
source=(${url}/releases/individual/proto/xproto-${pkgver}.tar.bz2)
sha256sums=('29e85568d1f68ceef8a2c081dad9bc0e5500a53cfffde24b564dc43d46ddf6ca')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd xproto-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd 
  done
}

package() {
  cd xproto-${pkgver}
  for _arch in ${_architectures}; do
    cd "${srcdir}/xproto-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "$pkgdir/usr/${_arch}/share"
  done
} 
