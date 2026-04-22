# Maintainer:
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.7.0
pkgrel=1
pkgdesc="A video editing, animation, and playback library for C++, Python, and Ruby"
arch=('x86_64')
url="https://github.com/openshot/libopenshot"
license=('LGPL-3.0-or-later')
depends=('babl'
         'ffmpeg'
         'glibc'
         'imagemagick'
         'jsoncpp'
         'libgcc'
         'libgomp'
         'libopenshot-audio'
         'libstdc++'
         'opencv'
         'protobuf'
         'python'
         'qt5-base'
         'resvg'
         'ruby'
         'zeromq')
makedepends=('catch2' 'cmake' 'cppzmq' 'doxygen' 'swig')
provides=('libopenshot.so')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('d36ad17e65534c890358ea7a12b039e94296327341835f39c5d76d257f5be5e8f874124b51005cd710cfc668a44dd898f63de2c674544d30b5a9d012273f56ce')
b2sums=('3c11f13d881b798e173c685f20700a2e060606a852834905547d971a569d85ccd7951753f4de2d119caebfacd1917df30c8038c6b69f3c9d31560c92e9b361d4')

build() {
    local cmake_options=(
        -B build
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -S "${pkgname}-${pkgver}"
        -W no-dev
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
