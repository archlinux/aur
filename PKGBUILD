# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-libxau
pkgver=1.0.12
pkgrel=1
arch=('any')
pkgdesc="X11 authorisation library (Android ${_android_arch})"
url="https://xorg.freedesktop.org/"
license=('custom')
groups=('android-libxau')
depends=("android-${_android_arch}-xorgproto"
         'android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/individual/lib/libXau-${pkgver}.tar.xz")
md5sums=('4c9f81acf00b62e5de56a912691bd737')

build() {
    cd "${srcdir}/libXau-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir=${ANDROID_PREFIX_ETC}
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libXau-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
