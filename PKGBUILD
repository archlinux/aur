# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libxdmcp
pkgver=1.1.4
pkgrel=1
pkgdesc="X11 Display Manager Control Protocol library (android)"
arch=('any')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=("android-${_android_arch}-xorgproto")
makedepends=("android-${_android_arch}-xorg-util-macros")
options=(!strip !buildflags staticlibs !emptydirs)
source=(${url}/releases/individual/lib/libXdmcp-${pkgver}.tar.xz)
sha512sums=('83b384d43bfb034c395f83f97d1c6e73aa3d5faa8f8756b08e697c0b9c3c87189651b51e8213fbd1f5f9cbc2d8136cbf143627481744345d78cfe0ff2ad074a9')

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
