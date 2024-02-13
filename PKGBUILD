# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-expat
pkgver=2.6.0
pkgrel=1
pkgdesc="An XML parser library (android)"
arch=('any')
url="https://libexpat.github.io/"
license=("custom")
depends=('android-ndk')
groups=(android-expat)
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-cmake')
source=("https://github.com/libexpat/libexpat/archive/R_${pkgver//./_}.tar.gz")
md5sums=('aa424e56fe6378bb4b9f26b903f42119')

build() {
    cd "${srcdir}"/libexpat-R_${pkgver//./_}/expat
    source android-env ${_android_arch}

    android-${_android_arch}-cmake .
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/libexpat-R_${pkgver//./_}/expat
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE} "${pkgdir}"/${ANDROID_PREFIX_BIN}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
