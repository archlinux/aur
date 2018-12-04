# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libopenshot-git
_srcname=libopenshot
pkgver=0.2.2.r3.g31e9e7b
pkgrel=1
pkgdesc='A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby (git version)'
arch=('i686' 'x86_64')
url='https://www.openshot.org/'
license=('LGPL3')
depends=('libmagick6' 'ffmpeg' 'x264' 'libopenshot-audio-git' 'python' 'jsoncpp' 'qt5-multimedia' 'zeromq')
makedepends=('git' 'cmake' 'doxygen' 'swig' 'unittestpp')
provides=('libopenshot')
conflicts=('libopenshot')
source=('git+https://github.com/OpenShot/libopenshot.git')
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
        -DUSE_SYSTEM_JSONCPP:BOOL='ON' \
        -DMAGICKCORE_HDRI_ENABLE='1' \
        -DMAGICKCORE_QUANTUM_DEPTH='16' \
        -DENABLE_RUBY='OFF' \
        -Wno-dev \
        ..
    make
}

package() {
    cd "${_srcname}/build"
    
    make DESTDIR="$pkgdir" install
}
