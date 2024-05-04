# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>

_android_arch=x86

pkgname=android-${_android_arch}-opencl-headers
pkgver=2023.04.17
pkgrel=1
pkgdesc="OpenCL (Open Computing Language) header files (Android ${_android_arch})"
arch=('any')
url='https://www.khronos.org/registry/cl/'
license=('custom')
depeds=('android-ndk')
makedepends=('android-cmake'
             'python')
optdepends=("android-${_android_arch}-opencl-clhpp: C++ support")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/KhronosGroup/OpenCL-Headers/archive/v${pkgver}.tar.gz")
sha256sums=('0ce992f4167f958f68a37918dec6325be18f848dee29a4521c633aae3304915d')

build() {
    cd "${srcdir}/OpenCL-Headers-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/OpenCL-Headers-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
}
