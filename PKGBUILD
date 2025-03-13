# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Campbell Jones <serebit at archlinux dot org>
# Contributor: Sandy Carter <aur at sandy dot mozmail dot com>
# Contributor: JstKddng <jk at vin dot ovh>

_android_arch=riscv64

pkgname=android-${_android_arch}-argparse
pkgver=3.2
pkgrel=1
arch=('any')
pkgdesc="Argument Parser for Modern C++ (Android ${_android_arch})"
url="https://github.com/p-ranav/argparse"
license=('MIT')
groups=('android-argparse')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/p-ranav/argparse/archive/v${pkgver}.tar.gz")
md5sums=('9a536026d9d565d362e57c7dd7224a4c')

build() {
    cd "${srcdir}/argparse-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DARGPARSE_BUILD_SAMPLES=OFF \
        -DARGPARSE_BUILD_TESTS=OFF \
        -Wno-dev
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/argparse-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
}
