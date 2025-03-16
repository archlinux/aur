# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Orivej Desh <smpuj@bk.ru>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libunibreak
pkgver=6.1
pkgrel=2
arch=("any")
pkgdesc="An implementation of the line breaking algorithm as described in Unicode 5.2.0 Standard Annex 14, Revision 24 (Android ${_android_arch})"
url="https://github.com/adah1972/libunibreak/"
license=("custom:zlib/libpng")
groups=('android-libunibreak')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/adah1972/libunibreak/archive/libunibreak_${pkgver//./_}.tar.gz")
md5sums=('860d6b7cd960a647ca995624a8a8fea0')

build() {
    cd "${srcdir}/libunibreak-libunibreak_${pkgver//./_}"
    source android-env ${_android_arch}

    ./bootstrap
    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libunibreak-libunibreak_${pkgver//./_}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
