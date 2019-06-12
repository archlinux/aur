# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86
source android-env ${_android_arch}

pkgname=android-${_android_arch}-speex
pkgver=1.2.0
pkgrel=2
pkgdesc="A free codec for free speech (android)"
arch=(any)
url="http://www.speex.org"
license=("BSD")
depends=("android-${_android_arch}-speexdsp"
         "android-${_android_arch}-libogg")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://downloads.xiph.org/releases/speex/speex-$pkgver.tar.gz")
md5sums=('8ab7bb2589110dfaf0ed7fa7757dc49c')

build() {
    cd "${srcdir}"/speex-${pkgver}

    android-${_android_arch}-configure \
        --disable-binaries

    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/speex-${pkgver}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
