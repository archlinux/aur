# Maintainer: Mopigames <mopigames@proton.me>
pkgname=vanilla-wiiu-git
pkgver=continuous.0.g67f7f6f
pkgrel=1
pkgdesc="A work-in-progress Wii U GamePad software clone for Linux"
arch=('x86_64')
url="https://github.com/vanilla-wiiu/vanilla"
license=('GPL-2.0')
depends=('ffmpeg' 'libnl' 'sdl2' 'sdl2_ttf' 'sdl2_image' 'openssl' 'libnm')
makedepends=('git' 'cmake' 'make')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long | sed 's/^v//' | sed 's/-/./g' | tr -d ':'
}

build() {
    cd "$pkgname"
    git submodule update --init --recursive
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$pkgname/build"
    make DESTDIR="$pkgdir" install
}