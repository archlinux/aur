# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_android_arch=riscv64

pkgname=android-${_android_arch}-libraw1394
pkgver=2.1.2
pkgrel=2
arch=('any')
pkgdesc="Provides an API to the Linux IEEE1394 (FireWire) driver (Android ${_android_arch})"
url="https://ieee1394.wiki.kernel.org/index.php/Main_Page"
license=('LGPL2.1')
groups=('android-libraw1394')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.kernel.org/pub/linux/libs/ieee1394/libraw1394-${pkgver}.tar.xz")
md5sums=('118060584c04f1aa5e29c4d22c1c235a')

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
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
