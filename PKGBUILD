# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-xtrans
pkgver=1.5.0
pkgrel=2
arch=('any')
pkgdesc="X transport library (Android, ${_android_arch})"
license=('custom')
url="https://xorg.freedesktop.org/"
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=(${url}/releases/individual/lib/xtrans-${pkgver}.tar.xz)
sha512sums=('e8091f11d4ad2b14e01de3eac56bdf2267ea26687ce66e3056374d0d02e049480c0b27c482f8828a0efd086f1e4c485108ca4dce3f83d66c1896effa3b38b228')

build() {
    cd "$srcdir/xtrans-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/xtrans-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
}
