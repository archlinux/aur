# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-opencl-headers
pkgver=2024.10.24
pkgrel=1
pkgdesc="OpenCL (Open Computing Language) header files (Android ${_android_arch})"
arch=('any')
url='https://www.khronos.org/registry/cl/'
license=('custom')
groups=('android-opencl-headers')
depeds=('android-ndk')
makedepends=('android-cmake'
             'python')
optdepends=("android-${_android_arch}-opencl-clhpp: C++ support")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/KhronosGroup/OpenCL-Headers/archive/v${pkgver}.tar.gz")
md5sums=('09e3c22ad7bf509127ac73baee81b71e')

build() {
    cd "${srcdir}/OpenCL-Headers-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -Wno-dev
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/OpenCL-Headers-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
}
