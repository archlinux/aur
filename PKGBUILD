# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=1.1.1
pkgrel=1
pkgdesc="A video editing, animation, and playback library for C++, Python, and Ruby"
arch=('x86_64')
url="https://github.com/OpenShot/libopenshot"
license=('LGPL-3.0-or-later')
depends=('babl'
         'ffmpeg'
         'glib2'
         'glibc'
         'imagemagick'
         'jsoncpp'
         'libgcc'
         'libgomp'
         'libopenshot-audio=1.0.2'
         'libpipewire'
         'libstdc++'
         'opencv'
         'protobuf'
         'python'
         'qt6-base'
         'resvg'
         'ruby')
makedepends=('catch2' 'cmake' 'doxygen' 'swig' 'vulkan-headers')
provides=('libopenshot.so')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('502ef29d0bcbcadc38f57aab395ca6b3391fa577e4e47812438dc87ad3182b2cfa9812f20675f16d386c94a710fe48404af72dd7a15096f76d3fc3bd661ad950')
b2sums=('5dbf12970635feb5efccca5015bfdd9bfa127dde8d26247dea247312948d799df577d06a2f0c96dc5427a7934f68804ea63ba7fb4384927cfd1623a98f3959a1')

build() {
    local cmake_options=(
        -B build
        -S "${pkgname}-${pkgver}"
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D USE_QT6=ON
        -W no-author
    )
    export CXXFLAGS+=" -I/usr/include/opencv4"
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
