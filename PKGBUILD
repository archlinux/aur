# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Chaiwat Suttipongsakul <cwt114@gmail.com>

_android_arch=aarch64

pkgname=android-${_android_arch}-libdatrie
pkgver=0.2.13
pkgrel=3
arch=('any')
pkgdesc="Double-array trie library (Android ${_android_arch})"
url='https://linux.thai.net/projects/datrie'
license=('LGPL-2.1-or-later')
groups=('android-libdatrie')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://linux.thai.net/pub/thailinux/software/libthai/libdatrie-${pkgver}.tar.xz")
md5sums=('e26b5aa008b5f3588ab38d2dce9e9325')

build() {
    cd "${srcdir}/libdatrie-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-doxygen-doc
    make -C datrie $MAKEFLAGS
}

package() {
    cd "${srcdir}/libdatrie-${pkgver}"
    source android-env ${_android_arch}

    make -C datrie DESTDIR="${pkgdir}" install
    make DESTDIR="${pkgdir}" install-pkgconfigDATA
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
