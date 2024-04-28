# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libraw1394
pkgver=2.1.2
pkgrel=1
arch=('any')
pkgdesc="Provides an API to the Linux IEEE1394 (FireWire) driver (Android ${_android_arch})"
url="https://ieee1394.wiki.kernel.org/index.php/Main_Page"
license=('LGPL2.1')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.kernel.org/pub/linux/libs/ieee1394/libraw1394-${pkgver}.tar.xz")
sha256sums=('03ccc69761d22c7deb1127fc301010dd13e70e44bb7134b8ff0d07590259a55e')

build() {
    cd "${srcdir}/libraw1394-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package () {
    cd "${srcdir}/libraw1394-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_BIN}"
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
