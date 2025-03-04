# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

pkgname=android-cmake
pkgver=2
pkgrel=1
arch=('any')
pkgdesc="CMake wrapper for Android"
depends=('cmake'
         'android-environment'
         'android-pkg-config')
license=("custom")
url="https://cmake.org/"
source=("android-cmake.sh")
md5sums=('0899aac2eaac372d074b4c4acec0df87')
_architectures="aarch64 armv7a-eabi riscv64 x86 x86-64"

build() {
    for _arch in ${_architectures}; do
        sed "s|@TRIPLE@|${_arch}|g" android-cmake.sh > android-${_arch}-cmake
    done
}

package() {
    install -d "${pkgdir}"/usr/bin

    for _arch in ${_architectures}; do
        install -m 755 android-${_arch}-cmake "${pkgdir}"/usr/bin/
    done
}
