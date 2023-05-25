# Maintainer: Edgar <Edgar{at}AnotherFoxGuy.com>

pkgname=stuntrally-git
pkgver=2.7.r37.g747b901d
pkgrel=1
pkgdesc="A 3D racing game based on VDrift and OGRE with track editor"
arch=('i686' 'x86_64')
url="https://stuntrally.tuxfamily.org/"
license=('GPL')
depends=('boost' 'ogre-legacy' 'mygui-ogre' 'sdl2' 'libvorbis' 'enet' 'bullet' 'openal' 'tinyxml' 'tinyxml2')
makedepends=('gcc' 'cmake>=2.8' 'git')
conflicts=('stuntrally-bin')
provides=('stuntrally')
source=("git+https://github.com/stuntrally/stuntrally.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/stuntrally"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
    cd "$srcdir/stuntrally"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/stuntrally"
    
    # get a clean build dir
    [[ -d build ]] && rm -rf build
    mkdir build && cd build

    # cd build
    
    cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$srcdir/stuntrally/build"

    make DESTDIR="$pkgdir" install
}
