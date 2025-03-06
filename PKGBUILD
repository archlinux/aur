# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-xtrans
pkgver=1.5.2
pkgrel=1
arch=('any')
pkgdesc="X transport library (Android ${_android_arch})"
license=('custom')
groups=('android-xtrans')
url="https://xorg.freedesktop.org/"
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/individual/lib/xtrans-${pkgver}.tar.xz")
md5sums=('1155b410c778f805659baf4373db2b92')

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
