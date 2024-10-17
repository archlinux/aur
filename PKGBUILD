# Maintainer: Porta <portalmaster137@gmail.com>
pkgname='nes-emu'
pkgver=r178.1549ac3
pkgrel=1
pkgdesc='A Nintendo Entertainment System emulator written in C++, Foked by Porta.'
arch=('x86_64')
url='https://github.com/portalmaster137/nes-emu'
license=('MIT')
depends=('sdl2')
makedepends=('git' 'cmake')
source=('nes-emu::git+https://github.com/portalmaster137/nes-emu')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
    cd "$pkgname/build"
    make DESTDIR="$pkgdir" install
}