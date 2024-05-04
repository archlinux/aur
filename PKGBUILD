# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-opencl-clhpp
pkgver=2023.04.17
pkgrel=1
arch=('any')
pkgdesc="OpenCL C++ header files (Android ${_android_arch})"
url='https://github.com/KhronosGroup/OpenCL-CLHPP'
license=('custom')
depends=("android-${_android_arch}-opencl-headers")
makedepends=('android-cmake'
             "android-${_android_arch}-opencl-headers")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/KhronosGroup/OpenCL-CLHPP/archive/v${pkgver}.tar.gz")
sha256sums=('179243843c620ef6f78b52937aaaa0a742c6ff415f9aaefe3c20225ee283b357')

build() {
    cd "${srcdir}/OpenCL-CLHPP-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_DOCS=ON \
        -DBUILD_TESTING=OFF \
        -DOpenCLHeaders_DIR="${ANDROID_PREFIX_SHARE}/cmake/OpenCLHeaders"
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/OpenCL-CLHPP-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
}
