# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=libopenshot-audio-git
pkgver=0.1.8.r103.g12a1529
pkgrel=1
pkgdesc='A high-quality audio editing and playback library used by libopenshot (git version)'
arch=('x86_64')
url='https://www.openshot.org/'
license=('LGPL3')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'zlib')
makedepends=('git' 'cmake' 'doxygen' 'freetype2' 'libx11')
provides=('libopenshot-audio' 'libopenshot-audio.so')
conflicts=('libopenshot-audio')
source=('git+https://github.com/OpenShot/libopenshot-audio.git')
sha256sums=('SKIP')

pkgver() {
    cd libopenshot-audio
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S libopenshot-audio \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        ..
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
