# Maintainer: James Armstrong

pkgname=(splashkit-git)
_gitname=splashkit
pkgver=r252.f1ce067
pkgrel=1
pkgdesc='A toolkit designed to make it easy for students to create games.'
arch=('x86_64')
url='http://splashkit.io/'
makedepends=(git cmake sdl2 sdl2_mixer sdl2_gfx sdl2_image sdl2_mixer sdl2_net sdl2_ttf sqlite libmikmod libpng smpeg2 curl)
source=('git+https://github.com/jarmstrong/splashkit.git')
md5sums=('SKIP')

pkgver() {
    cd $_gitname

    # Get the version number.
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $_gitname

    msg2 "Pulling the submodules"
    git submodule update --init --recursive
}

build() {
    cd $_gitname/projects/cmake
    
    msg2 "Building splashkit library"
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
    make -j 2
}

package() {
    cd $_gitname/projects/cmake

    make DESTDIR=$pkgdir install
}

