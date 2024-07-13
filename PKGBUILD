# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: arjan <arjan@archlinux.org>
# Contributor Sarah Hay <sarahhay@mb.sympatico.ca>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libdvdcss
pkgver=1.4.3
pkgrel=1
pkgdesc="Portable abstraction library for DVD decryption (Android ${_android_arch})"
url="https://www.videolan.org/developers/libdvdcss.html"
arch=('any')
license=('GPL')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://download.videolan.org/pub/libdvdcss/${pkgver}/libdvdcss-${pkgver}.tar.bz2")
md5sums=('e98239a88af9b2204f9b9d987c2bc71a')

build() {
    cd "${srcdir}/libdvdcss-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-doc
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libdvdcss-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
