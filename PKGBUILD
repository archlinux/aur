# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86

pkgname=android-${_android_arch}-libogg
pkgver=1.3.5
pkgrel=1
pkgdesc="Ogg bitstream and framing library (android)"
arch=('any')
url="http://xiph.org"
license=('BSD')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://downloads.xiph.org/releases/ogg/libogg-${pkgver}.tar.gz")
md5sums=('3267127fe8d7ba77d3e00cb9d7ad578d')

prepare() {
    source android-env ${_android_arch}
    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}"/libogg-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/libogg-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
