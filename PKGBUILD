# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libopenshot-audio-git
pkgver=0.1.7.r0.g21e092d
pkgrel=1
pkgdesc='A high-quality audio editing and playback library used by libopenshot (git version)'
arch=('i686' 'x86_64')
url='http://www.openshot.org/'
license=('LGPL3')
depends=('alsa-lib' 'freetype2' 'libxcursor' 'libxinerama' 'libxrandr')
makedepends=('git' 'cmake' 'doxygen')
provides=('libopenshot-audio')
conflicts=('libopenshot-audio')
source=("$pkgname"::'git+https://github.com/OpenShot/libopenshot-audio.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    
    mkdir -p build
    cd build
    
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "${pkgname}/build"
    
    make DESTDIR="$pkgdir" install
}
