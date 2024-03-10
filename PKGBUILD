# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-xcb-proto
pkgver=1.16.0
pkgrel=2
pkgdesc="XML-XCB protocol descriptions (Android, ${_android_arch})"
arch=('any')
url="https://xcb.freedesktop.org/"
license=('custom')
depends=('android-ndk')
makedepends=('android-configure'
             'python'
             "android-${_android_arch}-libxml2")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://xorg.freedesktop.org/archive/individual/proto/xcb-proto-$pkgver.tar.xz"{,.sig})
sha512sums=('54906f379a7aa2cbbfbbe54764c02dbf522ca8f6c54e07d4faae471aac3aee25d0359be38c808c8da887de228aed745582a78b2f56714b023bca8f3513b24972'
            'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # "Matt Turner <mattst88@gmail.com>"

build() {
    cd "$srcdir/xcb-proto-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/xcb-proto-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
}
