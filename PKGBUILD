# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-libxcursor
pkgver=1.2.3
pkgrel=1
arch=('any')
pkgdesc="X cursor management library (Android ${_android_arch})"
url="https://gitlab.freedesktop.org/xorg/lib/libxcursor"
license=('HPND-sell-variant')
groups=('android-libxcursor')
depends=("android-${_android_arch}-libxfixes"
         "android-${_android_arch}-libxrender"
         "android-${_android_arch}-libx11"
         "android-${_android_arch}-xorgproto")
makedepends=("android-${_android_arch}-xorg-util-macros")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://xorg.freedesktop.org//releases/individual/lib/libXcursor-${pkgver}.tar.xz")
md5sums=('5ce55e952ec2d84d9817169d5fdb7865')

build() {
    cd "${srcdir}/libXcursor-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}"
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libXcursor-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
