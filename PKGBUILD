# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64

pkgname=android-${_android_arch}-libtheora
pkgver=1.1.1
pkgrel=3
pkgdesc="An open video codec developed by the Xiph.org (android)"
arch=('any')
url="http://xiph.org"
license=("BSD")
depends=("android-${_android_arch}-libvorbis")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs)
source=("http://downloads.xiph.org/releases/theora/libtheora-${pkgver}.tar.bz2")
md5sums=('292ab65cedd5021d6b7ddd117e07cd8e')

prepare() {
    cd "${srcdir}"/libtheora-${pkgver}
    source android-env ${_android_arch}

    autoreconf -fi -I m4
}

build() {
    cd "${srcdir}"/libtheora-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-examples

    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/libtheora-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
