# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=notepadqq
pkgver=2.1.1
pkgrel=1
pkgdesc='A simple, general-purpose editor for Linux'
arch=('x86_64')
url='https://notepadqq.com'
license=('GPL-3.0-or-later')
depends=('glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'qt6-5compat' 'qt6-base' 'qt6-svg' 'qt6-webchannel' 'qt6-webengine' 'uchardet')
makedepends=('cmake' 'git' 'qt6-tools' 'qt6-websockets')
source=("git+https://github.com/notepadqq/notepadqq.git#tag=v${pkgver}")
sha256sums=('8c6f45910a946591eb48861627c5d3513649a8ef1a2824c6700bd1c60cb91872')

build() {
    local cmake_options=(
        -B build
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D NQQ_BUILD_TESTS=OFF
        -S "${pkgname}"
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
