# Maintainer: Alexis Maiquez <aur@almamu.com>
pkgname=linux-wallpaperengine-git
_pkgname=linux-wallpaperengine
pkgver=r355.9a59139
pkgrel=1
pkgdesc="use steam's wallpaperengine on linux"
arch=('x86_64')
url="https://github.com/Almamu/linux-wallpaperengine"
license=('GPL3')
depends=('lz4' 'ffmpeg' 'mpv' 'freeimage' 'xorg-xrandr' 'glfw-x11' 'glew' 'freeglut' 'libpulse')
makedepends=('git' 'cmake' 'sdl2' 'glm')
source=("${pkgname}::git+https://github.com/Almamu/linux-wallpaperengine.git#branch=main")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
        ( set -o pipefail
          git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        )
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
