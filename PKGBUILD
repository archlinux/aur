# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Chaiwat Suttipongsakul <cwt114@gmail.com>

_android_arch=x86-64

pkgname=android-${_android_arch}-libthai
pkgver=0.1.29
pkgrel=2
arch=('any')
pkgdesc="Thai language support library (Android ${_android_arch})"
url='https://linux.thai.net/projects/libthai'
license=('LGPL-2.1-or-later')
groups=('android-libthai')
depends=("android-${_android_arch}-libdatrie")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://linux.thai.net/pub/thailinux/software/libthai/libthai-${pkgver}.tar.xz")
md5sums=('c1fe8255d2bdfc5ea4f68dd9aff8b7f1')

build() {
    cd "${srcdir}/libthai-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-doxygen-doc
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libthai-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
