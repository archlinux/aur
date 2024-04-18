# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Chaiwat Suttipongsakul <cwt114@gmail.com>

_android_arch=aarch64

pkgname=android-${_android_arch}-libdatrie
pkgver=0.2.13
pkgrel=2
arch=('any')
pkgdesc="Double-array trie library (Android ${_android_arch})"
url='https://linux.thai.net/projects/datrie'
license=('LGPL-2.1-or-later')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://linux.thai.net/pub/thailinux/software/libthai/libdatrie-$pkgver.tar.xz")
sha256sums=('12231bb2be2581a7f0fb9904092d24b0ed2a271a16835071ed97bed65267f4be')

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

    make -C datrie DESTDIR="$pkgdir" install
    make DESTDIR="$pkgdir" install-pkgconfigDATA
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
