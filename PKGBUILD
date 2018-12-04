# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libopenshot-audio-git
_srcname=libopenshot-audio
pkgver=0.1.7.r3.g3861a2c
pkgrel=1
pkgdesc='A high-quality audio editing and playback library used by libopenshot (git version)'
arch=('i686' 'x86_64')
url='http://www.openshot.org/'
license=('LGPL3')
depends=('alsa-lib' 'freetype2' 'libxcursor' 'libxinerama' 'libxrandr')
makedepends=('git' 'cmake' 'doxygen')
provides=('libopenshot-audio')
conflicts=('libopenshot-audio')
source=('git+https://github.com/OpenShot/libopenshot-audio.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$_srcname"
    
    mkdir -p build
    cd build
    
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "${_srcname}/build"
    
    make DESTDIR="$pkgdir" install
}
