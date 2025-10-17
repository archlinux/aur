# Maintainer: Viktor Gunnerson <support@rumatallc.com>

pkgname=battlecity-git
_gitname=battlecity
pkgver=0.1.0.r0.g82c4222
pkgrel=1
pkgdesc="Remake of multidirectional shooter video game from NES"
arch=('x86_64')
url="https://github.com/gunnerson/${_gitname}"
license=('GPL-3.0-or-later')
depends=('glibc' 'libxi' 'libxcursor' 'libx11' 'libxrandr' 'gcc-libs' 'systemd-libs' 'flac' 'libvorbis' 'libogg')
makedepends=('git' 'cmake')
options=('!debug')

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    local cmake_options=(
        -B build
        -S $_gitname
        -W no-dev
        -D CMAKE_INSTALL_PREFIX=/usr
        -D CMAKE_BUILD_TYPE=Release
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
