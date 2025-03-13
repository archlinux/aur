# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libice
pkgver=1.1.2
pkgrel=1
arch=('any')
pkgdesc="X11 Inter-Client Exchange library (Android ${_android_arch})"
url="https://xorg.freedesktop.org/"
license=('custom')
groups=('android-libice')
depends=("android-${_android_arch}-xorgproto")
makedepends=("android-configure"
             "android-${_android_arch}-xtrans"
             "android-${_android_arch}-xorg-util-macros")
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/individual/lib/libICE-${pkgver}.tar.xz")
md5sums=('d1ffde0a07709654b20bada3f9abdd16')

build() {
    cd "${srcdir}/libICE-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}"
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libICE-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
