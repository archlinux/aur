# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64

pkgname=android-${_android_arch}-speex
pkgver=1.2.1
pkgrel=1
pkgdesc="A free codec for free speech (android)"
arch=(any)
url="http://www.speex.org"
license=("BSD")
depends=("android-${_android_arch}-speexdsp"
         "android-${_android_arch}-libogg")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://downloads.xiph.org/releases/speex/speex-$pkgver.tar.gz")
md5sums=('fe7bf610883ff202092b92c72fe0fe3e')

build() {
    cd "${srcdir}"/speex-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-binaries

    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/speex-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
