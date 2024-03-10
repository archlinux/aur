# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libxdmcp
pkgver=1.1.5
pkgrel=2
pkgdesc="X11 Display Manager Control Protocol library (Android, ${_android_arch})"
arch=('any')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=("android-${_android_arch}-xorgproto")
makedepends=('android-configure'
             "android-${_android_arch}-xorg-util-macros")
options=(!strip !buildflags staticlibs !emptydirs)
source=(${url}/releases/individual/lib/libXdmcp-${pkgver}.tar.xz)
md5sums=('ce0af51de211e4c99a111e64ae1df290')

build() {
    cd "$srcdir/libXdmcp-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}"
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/libXdmcp-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
