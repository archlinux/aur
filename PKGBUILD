# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=aarch64

pkgname=android-${_android_arch}-expat
pkgver=2.2.10
pkgrel=1
pkgdesc="An XML parser library (android)"
arch=('any')
url="https://libexpat.github.io/"
license=("custom")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-cmake')
source=("https://github.com/libexpat/libexpat/archive/R_${pkgver//./_}.tar.gz")
sha256sums=('62e280f5fd29a5b70973f623e20a7412c3e3912c2684cb0e462e2c881be129e1')

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
