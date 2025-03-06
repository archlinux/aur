# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-xcb-proto
pkgver=1.17.0
pkgrel=2
arch=('any')
pkgdesc="XML-XCB protocol descriptions (Android ${_android_arch})"
url="https://xcb.freedesktop.org/"
license=('custom')
depends=('android-ndk')
makedepends=('android-configure'
             "android-${_android_arch}-libxml2"
             'python')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://xorg.freedesktop.org/archive/individual/proto/xcb-proto-${pkgver}.tar.xz"{,.sig})
md5sums=('c415553d2ee1a8cea43c3234a079b53f'
         'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # "Matt Turner <mattst88@gmail.com>"

build() {
    cd "${srcdir}/xcb-proto-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/xcb-proto-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
}
