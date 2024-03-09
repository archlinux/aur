# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64

pkgname=android-${_android_arch}-expat
pkgver=2.6.1
pkgrel=1
pkgdesc="An XML parser library (Android ${_android_arch})"
arch=('any')
url="https://libexpat.github.io/"
license=("custom")
groups=('android-expat')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libexpat/libexpat/archive/R_${pkgver//./_}.tar.gz")
md5sums=('0cfa8405040dd2d4f643d4619ba3278a')

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
