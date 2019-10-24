# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64

pkgname=android-${_android_arch}-expat
pkgver=2.2.9
pkgrel=1
pkgdesc="An XML parser library (android)"
arch=('any')
url="http://expat.sourceforge.net"
license=("custom")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("http://downloads.sourceforge.net/expat/expat-${pkgver}.tar.bz2")
sha256sums=('f1063084dc4302a427dabcca499c8312b3a32a29b7d2506653ecc8f950a9a237')

build() {
    cd "${srcdir}"/expat-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-configure --without-docbook
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/expat-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE} "${pkgdir}"/${ANDROID_PREFIX_BIN}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
