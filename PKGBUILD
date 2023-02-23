# Maintainer: hzf <888iagiag888@gmail.com>
pkgname=linux-wallpaperengine-git
_pkgname=linux-wallpaperengine
pkgver=r334.5e384d9
pkgrel=1
pkgdesc="use steam's wallpaperengine on linux"
arch=('x86_64')
url="https://github.com/Almamu/linux-wallpaperengine"
license=('GPL3')
depends=('lz4'  'ffmpeg' 'mpv' 'freeimage' 'xorg-xrandr' 'glfw-x11' 'glew' 'freeglut' )
makedepends=('git' 'cmake' 'sdl_image' 'sdl_mixer' 'sdl_sound' 'glm')
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
    cd ${srcdir}/${pkgname}
    mkdir -p build
    cd build
    cmake ${srcdir}/${pkgname}/ 
    make 
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
